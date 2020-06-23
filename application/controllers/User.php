<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

/**
 * Class : User (UserController)
 * User Class to control all user related operations.
 * @author : Sinu Jose
 * @version : 1.1
 * @since : 23 June 2020
 */
class User extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
        $this->isLoggedIn();   
    }
    
    /**
     * This function used to load the first screen of the user
     */
    public function index()
    {
        $this->global['pageTitle'] = 'LMS : Dashboard';
        
        $this->loadViews("dashboard", $this->global, NULL , NULL);
    }
    
   

    /**
     * This function is used to load the add new form
     */
    function addNewteacher()
    {
        if($this->isAdmin() == TRUE)
        {
            $this->loadThis();
        }
        else
        {
            $this->load->model('user_model');
			
            $data['classes'] = $this->user_model->getClasess();
			//print_r($data['classes'] );exit;
            $this->global['pageTitle'] = 'LMS : Add New Teacher';

            $this->loadViews("addNewteacher", $this->global, $data, NULL);
        }
    }
	
	
	/**
     * This function is used to load the teacher list
     */
    function teacherListing()
    {
        if($this->isAdmin() == TRUE)
        {
            $this->loadThis();
        }
        else
        {        
            $searchText = $this->security->xss_clean($this->input->post('searchText'));
            $data['searchText'] = $searchText;
            
            $this->load->library('pagination');
            
            $count = $this->user_model->teacherListingCount($searchText);

			$returns = $this->paginationCompress ( "teacherListing/", $count, 10 );
            
            $data['userRecords'] = $this->user_model->teacherListing($searchText, $returns["page"], $returns["segment"]);
            
            $this->global['pageTitle'] = 'LMS : Teacher Listing';
            
            $this->loadViews("teachers", $this->global, $data, NULL);
        }
    }


    
    /**
     * This function is used to add new user to the system
     */
    function addNewTsubmit()
    {
        if($this->isAdmin() == TRUE)
        {
            $this->loadThis();
        }
        else
        {
            $this->load->library('form_validation');
            
            $this->form_validation->set_rules('Name','Full Name','trim|required|max_length[128]');
            $this->form_validation->set_rules('Email','Email','trim|required|valid_email|max_length[128]');
            $this->form_validation->set_rules('Password','Password','required|max_length[20]');
            $this->form_validation->set_rules('cPassword','Confirm Password','trim|required|matches[Password]|max_length[20]');
            $this->form_validation->set_rules('Subject','Subject','trim|required');
            $this->form_validation->set_rules('Telephone','Mobile Number','required|min_length[10]');
            
            if($this->form_validation->run() == FALSE)
            {
                $this->addNewTeacher();
            }
            else
            {
                $name = ucwords(strtolower($this->security->xss_clean($this->input->post('Name'))));
                $email = strtolower($this->security->xss_clean($this->input->post('Email')));
                $password = $this->input->post('Password');
                $subject = $this->input->post('Subject');
				$add = $this->input->post('Address');
				$qu = $this->input->post('Qualification');
                $mobile = $this->security->xss_clean($this->input->post('Telephone'));
                $userInfo = array('Email'=>$email, 'Password'=>getHashedPassword($password), 'Subject'=>$subject, 'Name'=> $name,
                                    'Telephone'=>$mobile, 'Address'=>$add, 'Qualification'=>$qu);
                
                $this->load->model('user_model');
                $result = $this->user_model->addNewTeacher($userInfo,$this->input->post('clasess'));
                
                if($result > 0)
                {
                    $this->session->set_flashdata('success', 'New Teacher created successfully');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Teacher creation failed');
                }
                
                redirect('teacherListing');
            }
        }
    }
	
	
	
    /**
     * This function is used load teacher edit information
     */
    function editTeacher($Id = NULL)
    {
			if($Id == null)
            {
                redirect('teacherListing');
            }
            //echo $Id;
            $data['userInfo'] = $this->user_model->getUserInfo($Id);
			//print_r($data['userInfo']);exit;
            
            $this->global['pageTitle'] = 'LMS : Edit Teacher';
            $data['classes'] = $this->user_model->getClasess();
			$tclasess = $this->user_model->getTClasess($Id);
			$exOp = []; 
			if(!empty($tclasess)){
				foreach($tclasess as $k1=>$v1){
					$exOp[] = $v1->cId; 
				}
			} 
			$data['exOp'] = $exOp;
            $this->loadViews("editTeacher", $this->global, $data, NULL);
        
    }
    
    
    /**
     * This function is used to edit the user information
     */
    function editTeacherSubmit()
    {
        if($this->isAdmin() == TRUE)
        {
            $this->loadThis();
        }
        else
        {
            $this->load->library('form_validation');
            
            $Id = $this->input->post('Id');
            
            $this->form_validation->set_rules('Name','Full Name','trim|required|max_length[128]');
            $this->form_validation->set_rules('Email','Email','trim|required|valid_email|max_length[128]');
            $this->form_validation->set_rules('Subject','Subject','trim|required');
            $this->form_validation->set_rules('Telephone','Mobile Number','required|min_length[10]');
            
            if($this->form_validation->run() == FALSE)
            {
                $this->editTeacher($Id);
            }
            else
            {
                $name = ucwords(strtolower($this->security->xss_clean($this->input->post('Name'))));
                $email = strtolower($this->security->xss_clean($this->input->post('Email')));
                $password = $this->input->post('Password');
                $subject = $this->input->post('Subject');
				$add = $this->input->post('Address');
				$qu = $this->input->post('Qualification');
                $mobile = $this->security->xss_clean($this->input->post('Telephone'));
                
                
                
                if(empty($password))
                {
                    $userInfo = array('Email'=>$email, 'Subject'=>$subject, 'Name'=> $name,
                                    'Telephone'=>$mobile, 'Address'=>$add, 'Qualification'=>$qu);
                }
                else
                {
                    $userInfo = array('Email'=>$email, 'Password'=>getHashedPassword($password), 'Subject'=>$subject, 'Name'=> $name,
                                    'Telephone'=>$mobile, 'Address'=>$add, 'Qualification'=>$qu);
                }
                
                $result = $this->user_model->editTeacher($userInfo,$Id,$this->input->post('clasess'));
                
                if($result == true)
                {
                    $this->session->set_flashdata('success', 'User updated successfully');
                }
                else
                {
                    $this->session->set_flashdata('error', 'User updation failed');
                }
                
                redirect('teacherListing');
            }
        }
    }


    /**
     * This function is used to delete the user 
     */
    function deleteTeacher()
    {
        if($this->isAdmin() == TRUE)
        {
            echo(json_encode(array('status'=>'access')));
        }
        else
        {
            $Id = $this->input->post('Id');
            $result = $this->user_model->deleteTeacher($Id);
            
            if ($result > 0) { echo(json_encode(array('status'=>TRUE))); }
            else { echo(json_encode(array('status'=>FALSE))); }
        }
    }
	
	
	
	
	/**
     * This function is used to load the add new form
     */
    function addNewclass()
    {
        if($this->isAdmin() == TRUE)
        {
            $this->loadThis();
        }
        else
        {
            $this->load->model('user_model');
            $data[] = '';
			
            $this->global['pageTitle'] = 'LMS : Add New Class';

            $this->loadViews("addNewclass", $this->global, $data, NULL);
        }
    }
	
	
	/**
     * This function is used to load the  list
     */
    function classListing()
    {
        if($this->isAdmin() == TRUE)
        {
            $this->loadThis();
        }
        else
        {        
            $searchText = $this->security->xss_clean($this->input->post('searchText'));
            $data['searchText'] = $searchText;
            
            $this->load->library('pagination');
            
            $count = $this->user_model->classListingCount($searchText);

			$returns = $this->paginationCompress ( "classListing/", $count, 5 );
            
            $data['userRecords'] = $this->user_model->classListing($searchText, $returns["page"], $returns["segment"]);
            
            $this->global['pageTitle'] = 'LMS : Class Listing';
            
            $this->loadViews("clasess", $this->global, $data, NULL);
        }
    }


    
    /**
     * This function is used to add new class to the system
     */
    function addNewCsubmit()
    {
        if($this->isAdmin() == TRUE)
        {
            $this->loadThis();
        }
        else
        {
            $this->load->library('form_validation');
            
            $this->form_validation->set_rules('cName','Class Name','trim|required|max_length[128]');            
            if($this->form_validation->run() == FALSE)
            {
                $this->addNewTClass();
            }
            else
            {
                $name = ucwords(strtolower($this->security->xss_clean($this->input->post('cName'))));                
                $Info = array('cName'=> $name, 'createdDate'=> date('Y-m-d h:i:s'));
                
                $this->load->model('user_model');
                $result = $this->user_model->addNewClass($Info);
                
                if($result > 0)
                {
                    $this->session->set_flashdata('success', 'New class created successfully');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Class creation failed');
                }
                
                redirect('classListing');
            }
        }
    }
	
	
	
    /**
     * This function is used load edit information
     */
    function editClass($Id = NULL)
    {
			if($Id == null)
            {
                redirect('classListing');
            }
            //echo $Id;
            $data['userInfo'] = $this->user_model->getClassInfo($Id);
			//print_r($data['userInfo']);exit;
            
            $this->global['pageTitle'] = 'LMS : Edit Class';
            
            $this->loadViews("editClass", $this->global, $data, NULL);
        
    }
    
    
    /**
     * This function is used to edit the user information
     */
    function editClassSubmit()
    {
        if($this->isAdmin() == TRUE)
        {
            $this->loadThis();
        }
        else
        {
            $Id = $this->input->post('cId');
			$this->load->library('form_validation');
            
            $cId = $this->input->post('cId');
            
            $this->form_validation->set_rules('cName','Class Name','trim|required|max_length[128]');
            
            if($this->form_validation->run() == FALSE)
            {
                $this->editClass($cId);
            }
            else
            {
                 $name = ucwords(strtolower($this->security->xss_clean($this->input->post('cName'))));      
				 $Info = array('cName'=> $name, 'createdDate'=>date('Y-m-d h:i:s'));                
                 $result = $this->user_model->editClass($Info, $Id);
                
                if($result == true)
                {
                    $this->session->set_flashdata('success', 'Class pdated successfully');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Class updation failed');
                }
                
                redirect('classListing');
            }
        }
    }


    /**
     * This function is used to delete the user 
     */
    function deleteClass()
    {
        if($this->isAdmin() == TRUE)
        {
            echo(json_encode(array('status'=>'access')));
        }
        else
        {
            $Id = $this->input->post('Id');
            $result = $this->user_model->deleteClass($Id);
            
            if ($result > 0) { echo(json_encode(array('status'=>TRUE))); }
            else { echo(json_encode(array('status'=>FALSE))); }
        }
    }
	
	
	function addAttendants()
    {
        if($this->isAdmin() == TRUE)
        {
            $this->loadThis();
        }
        else
        {
            $this->load->model('user_model');
            $data['teachers'] = $this->user_model->getAllTeachers();
			
            $this->global['pageTitle'] = 'LMS : Add Attendance';

            $this->loadViews("addAtt", $this->global, $data, NULL);
        }
    }
	
	function AttSubmit(){
		$cDate = date('Y-m-d',strtotime($_POST['cDate']));
		$attC = $_POST['attC'];
		if(!empty($cDate)){
			if(!empty($attC)){
				$tIds = implode(",",$attC);
				$Info = array('aDate'=> $cDate, 'tIds'=>$tIds ,'Present'=> 1);
				//print_r($Info);exit;
				$this->load->model('user_model');
                $result = $this->user_model->addNewAtt($Info);
				if($result > 0)
                {
                    $this->session->set_flashdata('success', 'Added successfully');
                }
                else
                {
                    $this->session->set_flashdata('error', 'failed');
                } 
			}			
		}
		redirect('addAttendants');
	}
	
	
	/**
     * This function is used to load the teacher list
     */
    function attendantsListing()
    {
        if($this->isAdmin() == TRUE)
        {
            $this->loadThis();
        }
        else
        {        
            $searchText = $this->security->xss_clean($this->input->post('searchText'));
            $data['searchText'] = $searchText;
            
            $this->load->library('pagination');
            
            $count = $this->user_model->attListingCount($searchText);

			$returns = $this->paginationCompress ( "attListing/", $count, 10 );
            
            $data['userRecords'] = $this->user_model->attListing($searchText, $returns["page"], $returns["segment"]);
            
            $this->global['pageTitle'] = 'LMS : Attendants Listing';
            
            $this->loadViews("attendants", $this->global, $data, NULL);
        }
    }
	
	
	
	
	
	/**
     * This function is used to check whether email already exist or not
     */
    function checkEmailExists()
    {
        $userId = $this->input->post("userId");
        $email = $this->input->post("email");

        if(empty($userId)){
            $result = $this->user_model->checkEmailExists($email);
        } else {
            $result = $this->user_model->checkEmailExists($email, $userId);
        }

        if(empty($result)){ echo("true"); }
        else { echo("false"); }
    }
    

    
    
    /**
     * Page not found : error 404
     */
    function pageNotFound()
    {
        $this->global['pageTitle'] = 'LMS : 404 - Page Not Found';
        
        $this->loadViews("404", $this->global, NULL, NULL);
    }

   

    /**
     * This function is used to show users profile
     */
    function profile($active = "details")
    {
        $data["userInfo"] = $this->user_model->getUserInfoWithRole($this->vendorId);
        $data["active"] = $active;
        
        $this->global['pageTitle'] = $active == "details" ? 'LMS : My Profile' : 'LMS : Change Password';
        $this->loadViews("profile", $this->global, $data, NULL);
    }

    /**
     * This function is used to update the user details
     * @param text $active : This is flag to set the active tab
     */
    function profileUpdate($active = "details")
    {
        $this->load->library('form_validation');
            
        $this->form_validation->set_rules('fname','Full Name','trim|required|max_length[128]');
        $this->form_validation->set_rules('mobile','Mobile Number','required|min_length[10]');
        $this->form_validation->set_rules('email','Email','trim|required|valid_email|max_length[128]|callback_emailExists');        
        
        if($this->form_validation->run() == FALSE)
        {
            $this->profile($active);
        }
        else
        {
            $name = ucwords(strtolower($this->security->xss_clean($this->input->post('fname'))));
            $mobile = $this->security->xss_clean($this->input->post('mobile'));
            $email = strtolower($this->security->xss_clean($this->input->post('email')));
            
            $userInfo = array('name'=>$name, 'email'=>$email, 'mobile'=>$mobile, 'updatedBy'=>$this->vendorId, 'updatedDtm'=>date('Y-m-d H:i:s'));
            
            $result = $this->user_model->editUser($userInfo, $this->vendorId);
            
            if($result == true)
            {
                $this->session->set_userdata('name', $name);
                $this->session->set_flashdata('success', 'Profile updated successfully');
            }
            else
            {
                $this->session->set_flashdata('error', 'Profile updation failed');
            }

            redirect('profile/'.$active);
        }
    }

    /**
     * This function is used to change the password of the user
     * @param text $active : This is flag to set the active tab
     */
    function changePassword($active = "changepass")
    {
        $this->load->library('form_validation');
        
        $this->form_validation->set_rules('oldPassword','Old password','required|max_length[20]');
        $this->form_validation->set_rules('newPassword','New password','required|max_length[20]');
        $this->form_validation->set_rules('cNewPassword','Confirm new password','required|matches[newPassword]|max_length[20]');
        
        if($this->form_validation->run() == FALSE)
        {
            $this->profile($active);
        }
        else
        {
            $oldPassword = $this->input->post('oldPassword');
            $newPassword = $this->input->post('newPassword');
            
            $resultPas = $this->user_model->matchOldPassword($this->vendorId, $oldPassword);
            
            if(empty($resultPas))
            {
                $this->session->set_flashdata('nomatch', 'Your old password is not correct');
                redirect('profile/'.$active);
            }
            else
            {
                $usersData = array('password'=>getHashedPassword($newPassword), 'updatedBy'=>$this->vendorId,
                                'updatedDtm'=>date('Y-m-d H:i:s'));
                
                $result = $this->user_model->changePassword($this->vendorId, $usersData);
                
                if($result > 0) { $this->session->set_flashdata('success', 'Password updation successful'); }
                else { $this->session->set_flashdata('error', 'Password updation failed'); }
                
                redirect('profile/'.$active);
            }
        }
    }

    /**
     * This function is used to check whether email already exist or not
     * @param {string} $email : This is users email
     */
    function emailExists($email)
    {
        $userId = $this->vendorId;
        $return = false;

        if(empty($userId)){
            $result = $this->user_model->checkEmailExists($email);
        } else {
            $result = $this->user_model->checkEmailExists($email, $userId);
        }

        if(empty($result)){ $return = true; }
        else {
            $this->form_validation->set_message('emailExists', 'The {field} already taken');
            $return = false;
        }

        return $return;
    }
}

?>