<?php
namespace Models;

use \Core\Model;

class Permissions extends Model {


    public function getPermissions($id_permission){

        $array = array();

        $sql = "SELECT id_permission_item FROM permission_links WHERE id_permission_group = :id_permission";
        $sql = $this->db->prepare($sql);
        $sql->bindValue(":id_permission", $id_permission);
        $sql->execute();

        if($sql->rowCount() > 0){
            $data = $sql->fetchAll();

            $ids = array();

            foreach ($data as $data_item) {
               $ids[] = $data_item['id_permission_item'];
            }

            $sql = "SELECT slug FROM permission_items WHERE id IN (".implode(',', $ids).")";
            $sql = $this->db->query($sql);

            if($sql->rowCount() > 0){
                $data = $sql->fetchAll();
                
                foreach ($data as $data_item) {
                    $array[] = $data_item['slug'];
                }

            }

        }

        return $array;

    }

    public function getAllGroups(){
        $array = array();
       
        $sql = "SELECT permission_groups.*, (select count(users.id) from users where users.id_permission = permission_groups.id) as total_users  FROM permission_groups";
        $sql = $this->db->query($sql);

        if($sql->rowCount() > 0){
            $array = $sql->fetchAll(\PDO::FETCH_ASSOC);
        }

		return $array;
    }

    public function deleteGroup($id_group){

        $sql = "SELECT id FROM users WHERE id_permission = :id_group";
        $sql = $this->db->prepare($sql);
        $sql->bindValue(':id_group', $id_group);
        $sql->execute();

        if($sql->rowCount() === 0){   
            $sql = "DELETE FROM permission_links WHERE id_permission_group = :id_group";
            $sql = $this->db->prepare($sql);
            $sql->bindValue(":id_group", $id_group);
            $sql->execute();

            $sql = "DELETE FROM permission_groups WHERE id = :id_group";
            $sql = $this->db->prepare($sql);
            $sql->bindValue(":id_group", $id_group);
            $sql->execute();
        }

    }

}
















