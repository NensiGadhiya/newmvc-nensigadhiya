<?php

/**
 * 
 */
class Controller_Eav_Attribute extends Controller_Core_Action
{
	public function gridAction()
	{
		$layout = $this->getLayout();
		$grid = new Block_Eav_Attribute_Grid();

		$layout->getChild('content')->addChild('grid', $grid);
		$attributes = $grid->getAttribute();
		$layout->render();

	}

	public function addAction()	
	{
		$message = Ccc::getModel('Core_Message');
		
	try{
		$attribute = Ccc::getModel('Eav_Attribute');
		if(!$attribute){
				throw new Exception("Invalid Id.", 1);
			}
			$layout = $this->getLayout();
			$edit = $layout->createBlock('Eav_Attribute_Edit');
			$edit->setData(['attribute'=>$attribute]);
			$layout->getChild('content')
				->addChild('edit',$edit);
			$layout->render();
		}	
	catch (Exception $e) {
			$message->addMessages('Attribute not Saved',Model_Core_Message::FAILURE);
			$this->redirect("index.php?a=grid&c=eav_attribute");	
		}
	}

	public function editAction()
	{
		$message = Ccc::getModel('Core_Message');
		try 
		{
			$id = $this->getRequest()->getParam('id');
			if(!$id){
	    		throw new Exception("Invalid request.", 1);
			}
			$attribute = Ccc::getModel('Eav_Attribute')->load($id);
			if(!$attribute){
				throw new Exception("Invalid Id.", 1);
			}
			$layout = new Block_Core_Layout();
			$edit = $layout->createBlock('Eav_Attribute_Edit');
			$edit->setData(['attribute'=>$attribute]);
			$layout->getChild('content')->addChild('edit',$edit);
			$layout->render();
		} 
		catch (Exception $e) 
		{
			$message->addMessages('Attribute Not Saved',Model_Core_Message::FAILURE);
			$this->redirect("index.php?a=grid&c=eav_attribute");
		}
	}

	public function saveAction()
		{
			try {
				$attribute = Ccc::getModel('Eav_Attribute');
					$request=$this->getRequest();
					if (!$request->isPost()){
				throw new Exception("Invalid Request", 1);
					}
					$attributes = $request->getPost('Eav_Attribute');
					if (!$attributes) {
						throw new Exception("Data not posted", 1);
					}
					$id = $request->getParam('attribute_id');
					if(!$id){
						if(!$attribute->load($id)){
							throw new Exception("Data not found.", 1);
						}
					}
					$data = $attribute->setData($attributes);
					if ($data->attribute_id) {
						$data->update_at = date('Y-m-d h:i:sa');
					}
					else{
						$data->create_at = date('Y-m-d h:i:sa');
					}
					$data = $attribute->save();
					$message = new Model_Core_Message();
					$message->addMessages("Attribute saved successfully.",Model_Core_Message::SUCCESS);
				$this->redirect("index.php?a=grid&c=eav_attribute");
				
			} catch (Exception $e) {
				$message = new Model_Core_Message();
				$message->addMessages("Attribute not saved.",Model_Core_Message::FAILURE);
				$this->redirect("index.php?a=grid&c=eav_attribute");
			}
		}

	public function deleteAction()
	{
		try {
			$product = Ccc::getModel('Eav_Attribute');
				$request = $this->getRequest();
				if (!$request->isGet())
				{
					throw new Exception("Invalid request", 1);
				}
				$id = $request->getParam('attribute_id');
				if (!$id)
				{
					throw new Exception("id not found", 1);
				}
				$product->load($id);
				$product->delete();
				$message = new Model_Core_Message();
				$message->addMessages("Attribute deleted successfully..", Model_Core_Message::SUCCESS);
				$this->redirect("index.php?a=grid&c=eav_attribute");
			}catch (Exception $e)
			{
				$message = new Model_Core_Message();
				$message->addMessages("row not delete..", Model_Core_Message::FAILURE);
				$this->redirect("index.php?a=grid&c=eav_attribute");
			}
	}
}