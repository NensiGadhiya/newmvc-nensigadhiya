<?php

class Controller_Admin extends Controller_Core_Action
{
		public $adminRow = null;

	public function setAdminRow($adminRow)
	{
			$this->adminRow=$adminRow;
			return $this;
	}
	public function getAdminRow()
	{
		if ($this->adminRow!=null)
		{
			return $this->adminRow;
		}
		$adminRow= Ccc::getModel('Admin_Row');
		$this->setAdminRow($adminRow);
		return $adminRow;
	}

	public function gridAction()
	{
		try {
			$layout = $this->getLayout();
			$grid = new Block_Admin_Grid();

			$layout->getChild('content')->addChild('grid', $grid);
			$layout->render();
		} catch (Exception $e) {
			$message = new Model_Core_Message();
			$message->addMessages("Data not posted.",Model_Core_Message::FAILURE);
			$this->redirect("index.php?a=grid&c=admin");
		}
	}

	public function addAction()
	 {
	 	 try {
				$layout = $this->getLayout();
				$admin = Ccc::getModel('Admin');
				$add = $layout->createBlock('Admin_Edit')->setData(['admin'=>$admin]);

				$layout->getChild('content')->addChild('add', $add);

				$layout->render();
		
	 	} catch (Exception $e) {
	 		$message = new Model_Core_Message();
	 	 $message->addMessages("Data not found..",Model_Core_Message::FAILURE);
	 	 $this->redirect("index.php?a=grid&c=admin");
	 	}
	 }

	 public function editAction()
	 {
	 	try {
			$request = $this->getRequest();
			$id=$request->getParam('admin_id');
			if(!$id)
			{
				throw new Exception("invalid Request", 1);
				
			}
			$admin = Ccc::getModel('Admin');
			$query = "SELECT * FROM `admin` WHERE `admin_id`= '$id'";
			// print_r($query);
			$admin =$admin->fetchRow($query);
			if(!$admin)
			{
				throw new Exception('invalid id', 1);
				
			}
			$layout = $this->getLayout();
			$edit = $layout->createBlock('Admin_Edit');
			$edit->setData(['admin' => $admin]);
			$layout->getChild('content')->addChild('edit',$edit);

			$layout->render();
		
	 	} catch (Exception $e) {
	 		$message = new Model_Core_Message();
			$message->addMessages("Data not found..",Model_Core_Message::FAILURE);
			$this->redirect("index.php?a=grid&c=admin");
	 	}
	 }

	public function saveAction()
		{
			try {
				$adminRow = Ccc::getModel('Admin');
					$request=$this->getRequest();
					if (!$request->isPost()){
				throw new Exception("Invalid Request", 1);
					}
					$admins = $request->getPost('admin');
					if (!$admins) {
						throw new Exception("Data not posted", 1);
					}
					// echo "111";
					$id = $request->getParam('admin_id');
					// print_r($id);
					if(!$id){
						if(!$adminRow->load($id)){
							throw new Exception("Data not found.", 1);
						}
					}
					$data = $adminRow->setData($admins);
					if ($data->admin_id) {
						$data->update_at = date('Y-m-d h:i:sa');
					}
					else{
						$data->create_at = date('Y-m-d h:i:sa');
					}
					$data = $adminRow->save();
					// print_r($data);
					$message = new Model_Core_Message();
					$message->addMessages("Data saved successfully.",Model_Core_Message::SUCCESS);
				$this->redirect("index.php?a=grid&c=admin");
				
			} catch (Exception $e) {
				$message = new Model_Core_Message();
				$message->addMessages("Data not saved.",Model_Core_Message::FAILURE);
				$this->redirect("index.php?a=grid&c=admin");
			}
		}

		public function deleteAction()
		{
		try {
			$admin = Ccc::getModel('Admin');
				$request = $this->getRequest();
				if (!$request->isGet())
				{
					throw new Exception("Invalid request", 1);
				}
				$id = $request->getParam('admin_id');
				if (!$id)
				{
					throw new Exception("id not found", 1);
				}
				$admin->load($id)->delete();

				$message = new Model_Core_Message();
				$message->addMessages("Data deleted successfully..",Model_Core_Message::SUCCESS);
				$this->redirect("index.php?a=grid&c=admin");
			}catch (Exception $e)
			{
				$message = new Model_Core_Message();
				$message->addMessages("Row not deleted.",Model_Core_Message::FAILURE);
				$this->redirect("index.php?a=grid&c=admin");
			}
		}
	
}