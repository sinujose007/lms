<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Class : User_model (User Model)
 * User model class to get to handle user related data 
 * @author : Sinu Jose
 * @version : 1.1
 * @since : 23 June 2020
 */
class User_model extends CI_Model
{
   
    /**
     * This function is used to check whether email id is already exist or not
     * @param {string} $email : This is email id
     * @param {number} $userId : This is user id
     * @return {mixed} $result : This is searched result
     */
    function checkEmailExists($email, $userId = 0)
    {
        $this->db->select("email");
        $this->db->from("tbl_users");
        $this->db->where("email", $email);   
        $this->db->where("isDeleted", 0);
        if($userId != 0){
            $this->db->where("userId !=", $userId);
        }
        $query = $this->db->get();

        return $query->result();
    }
    
    
    /**
     * This function is used to add new user to system
     * @return number $insert_id : This is last inserted id
     */
    function addNewTeacher($userInfo,$cls)
    {
        $this->db->trans_start();
        $this->db->insert('teachers', $userInfo);        
        $insert_id = $this->db->insert_id();
		
		if(!empty($cls)){
			foreach($cls as $k=>$v){
				$Info = array('tId'=> $insert_id, 'cId'=>$v, 'DateAssigned'=>date('Y-m-d h:i:s'));
				$this->db->insert('teacher_clasess', $Info);
			}
		}
        
        $this->db->trans_complete();        
        return $insert_id;
    }
    
    /**
     * This function used to get user information by id
     * @param number $userId : This is user id
     * @return array $result : This is user information
     */
    function getUserInfo($Id)
    {
        $this->db->select('*');
        $this->db->from('teachers');
        $this->db->where('Active', 1);
		$this->db->where('Id', $Id);
        $query = $this->db->get();
        
        return $query->row();
    }
    
    
    /**
     * This function is used to update the user information
     * @param array $userInfo : This is users updated information
     * @param number $userId : This is user id
     */
    function editTeacher($userInfo, $Id,$cls)
    {
        $this->db->where('Id', $Id);
        $this->db->update('teachers', $userInfo);
		
		if(!empty($cls)){
			$this->db->where('tId', $Id);
			$this->db->delete('teacher_clasess');
			foreach($cls as $k=>$v){
				$Info = array('tId'=> $Id, 'cId'=>$v, 'DateAssigned'=>date('Y-m-d h:i:s'));
				$this->db->insert('teacher_clasess', $Info);
			}
		}
		
        
        return TRUE;
    }
    
    
    
    /**
     * This function is used to delete the user information
     * @param number $userId : This is user id
     * @return boolean $result : TRUE / FALSE
     */
    function deleteTeacher($Id)
    {
        $this->db->where('Id', $Id);
        $this->db->delete('teachers');
        
        return $this->db->affected_rows();
    }


	
	/**
     * This function is used to get the teacher listing count
     * @param string $searchText : This is optional search text
     * @return number $count : This is row count
     */
    function teacherListingCount($searchText = '')
    {
        $this->db->select('BaseTbl.Id');
        $this->db->from('teachers as BaseTbl');
       
        if(!empty($searchText)) {
            $likeCriteria = "(BaseTbl.Email  LIKE '%".$searchText."%'
                            OR  BaseTbl.Name  LIKE '%".$searchText."%'
							OR  BaseTbl.Subject  LIKE '%".$searchText."%'
                            OR  BaseTbl.Telephone  LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }
        $this->db->where('BaseTbl.Active',1);
        $query = $this->db->get();
        
        return $query->num_rows();
    }
    
    /**
     * This function is used to get the user listing count
     * @param string $searchText : This is optional search text
     * @param number $page : This is pagination offset
     * @param number $segment : This is pagination limit
     * @return array $result : This is result
     */
    function teacherListing($searchText = '', $page, $segment)
    {
        $this->db->select('BaseTbl.*');
        $this->db->from('teachers as BaseTbl');
		//$this->db->join('teacher_clasess as tc', 'tc.tId = BaseTbl.Id','left');
        //$this->db->join('clasess as c', 'c.cId = tc.cId','left');
		
        if(!empty($searchText)) {
            $likeCriteria = "(BaseTbl.Email  LIKE '%".$searchText."%'
                            OR  BaseTbl.Name  LIKE '%".$searchText."%'
							OR  BaseTbl.Subject  LIKE '%".$searchText."%'
                            OR  BaseTbl.Telephone  LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }
        $this->db->where('BaseTbl.Active',1);
        $this->db->order_by('BaseTbl.Id', 'DESC');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
        
        $result = $query->result();      

		if(!empty($result)){
			foreach($result as $k=>$v){
				$tId = $v->Id;
				$this->db->select('BaseTbl.*,c.cName');
				$this->db->from('teacher_clasess as BaseTbl');
				$this->db->join('clasess as c', 'c.cId = BaseTbl.cId','left');
				$this->db->where('tId', $tId);
				$query = $this->db->get();
				$result[$k]->clasess = $query ->result();        
			}
		}
        return $result;
    }
	
	
	
	/**
     * This function is used to add new class
     */
    function addNewClass($Info)
    {
        $this->db->trans_start();
        $this->db->insert('clasess', $Info);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }
	
	/**
     * This function is used to add attendants
     */
    function addNewAtt($Info)
    {
        $this->db->trans_start();
        $this->db->insert('attendants', $Info);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }
	
	
    
    /**
     * This function used to get  information by id
     */
    function getClassInfo($Id)
    {
        $this->db->select('*');
        $this->db->from('clasess');
        $this->db->where('Active', 1);
		$this->db->where('cId', $Id);
        $query = $this->db->get();
        
        return $query->row();
    }
	
	 /**
     * This function used to get  information by id
     */
    function getClasess()
    {
        $this->db->select('*');
        $this->db->from('clasess');
        $this->db->where('Active', 1);
        $query = $this->db->get();
        
        return $query->result();
    }
	function getAllTeachers()
    {
        $this->db->select('*');
        $this->db->from('teachers');
        $this->db->where('Active', 1);
        $query = $this->db->get();
        
        return $query->result();
    }
	
	
	
	/**
     * This function used to get  information by id
     */
    function getTClasess($Id)
    {
        $this->db->select('BaseTbl.*,c.cName');
        $this->db->from('teacher_clasess as BaseTbl');
        $this->db->join('clasess as c', 'c.cId = BaseTbl.cId','left');
		$this->db->where('tId', $Id);
        $query = $this->db->get();
        
        return $query->result();
    }
	
	
    
    
    /**
     * This function is used to update the information
     */
    function editClass($Info, $Id)
    {
        $this->db->where('cId', $Id);
        $this->db->update('clasess', $Info);
        
        return TRUE;
    }
    
    
    
    /**
     * This function is used to delete information
     */
    function deleteClass($Id)
    {
        $this->db->where('cId', $Id);
        $this->db->delete('clasess');
        
        return $this->db->affected_rows();
    }
	
	/**
     * This function is used to get the  listing count
     */
    function classListingCount($searchText = '')
    {
        $this->db->select('BaseTbl.cId');
        $this->db->from('clasess as BaseTbl');
       
        if(!empty($searchText)) {
            $likeCriteria = "(BaseTbl.cName  LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }
        $this->db->where('BaseTbl.Active',1);
        $query = $this->db->get();
        
        return $query->num_rows();
    }
    
    /**
     * This function is used to get the listing 
     */
    function classListing($searchText = '', $page, $segment)
    {
        $this->db->select('BaseTbl.*');
        $this->db->from('clasess as BaseTbl');
        if(!empty($searchText)) {
            $likeCriteria = "(BaseTbl.cName  LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }
        $this->db->where('BaseTbl.Active',1);
        $this->db->order_by('BaseTbl.cId', 'DESC');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
        
        $result = $query->result();        
        return $result;
    }
	
	
	/**
     * This function is used to get the  listing count
     */
    function attListingCount($searchText = '')
    {
        $this->db->select('BaseTbl.aId');
        $this->db->from('attendants as BaseTbl');
       
        if(!empty($searchText)) {
            $likeCriteria = "(BaseTbl.aDate  LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }
       $query = $this->db->get();
        
        return $query->num_rows();
    }
    
    /**
     * This function is used to get the listing 
     */
    function attListing($searchText = '', $page, $segment)
    {
        $this->db->select('BaseTbl.*');
        $this->db->from('attendants as BaseTbl');
        if(!empty($searchText)) {
            $likeCriteria = "(BaseTbl.aDate  LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }
		$this->db->order_by('BaseTbl.aId', 'DESC');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
        
        $result = $query->result(); 
		if(!empty($result)){
			foreach($result as $k=>$v){
				$ids = $v->tIds;
				$this->db->select( 'Name' );
				$this->db->from( 'teachers' );
				$where = "Id IN ($ids)";
				$this->db->where( $where );
				$query = $this->db->get();        
				$re = $query->result(); $nme='';
				foreach($re as $k1=>$v1){
					$nme .= $v1->Name.",";
				}
				//echo $nme;exit;
				$result[$k]->tIds = $nme;
			}
		}
        return $result;
    }
	
	
	
	
	
	

	
	/**
     * This function is used to update the user information
     * @param array $userInfo : This is users updated information
     * @param number $userId : This is user id
     */
    function editUser($userInfo, $userId)
    {
        $this->db->where('userId', $userId);
        $this->db->update('tbl_users', $userInfo);
        
        return TRUE;
    }
	
	
    /**
     * This function is used to match users password for change password
     * @param number $userId : This is user id
     */
    function matchOldPassword($userId, $oldPassword)
    {
        $this->db->select('userId, password');
        $this->db->where('userId', $userId);        
        $this->db->where('isDeleted', 0);
        $query = $this->db->get('tbl_users');
        
        $user = $query->result();

        if(!empty($user)){
            if(verifyHashedPassword($oldPassword, $user[0]->password)){
                return $user;
            } else {
                return array();
            }
        } else {
            return array();
        }
    }
    
    /**
     * This function is used to change users password
     * @param number $userId : This is user id
     * @param array $userInfo : This is user updation info
     */
    function changePassword($userId, $userInfo)
    {
        $this->db->where('userId', $userId);
        $this->db->where('isDeleted', 0);
        $this->db->update('tbl_users', $userInfo);
        
        return $this->db->affected_rows();
    }


   
    /**
     * This function used to get user information by id
     * @param number $userId : This is user id
     * @return array $result : This is user information
     */
    function getUserInfoById($userId)
    {
        $this->db->select('userId, name, email, mobile, roleId');
        $this->db->from('tbl_users');
        $this->db->where('isDeleted', 0);
        $this->db->where('userId', $userId);
        $query = $this->db->get();
        
        return $query->row();
    }

    /**
     * This function used to get user information by id with role
     * @param number $userId : This is user id
     * @return aray $result : This is user information
     */
    function getUserInfoWithRole($userId)
    {
        $this->db->select('BaseTbl.userId, BaseTbl.email, BaseTbl.name, BaseTbl.mobile, BaseTbl.roleId, Roles.role');
        $this->db->from('tbl_users as BaseTbl');
        $this->db->join('tbl_roles as Roles','Roles.roleId = BaseTbl.roleId');
        $this->db->where('BaseTbl.userId', $userId);
        $this->db->where('BaseTbl.isDeleted', 0);
        $query = $this->db->get();
        
        return $query->row();
    }
    

}

  