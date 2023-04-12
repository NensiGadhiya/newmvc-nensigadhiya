<?php

class  Controller_Category extends Controller_Core_Action
{
	protected $category = null;
	protected $categoryid = null;
	protected $categoryrow = null;
	public function setCategory($category)
	{
		$this->category =$category;
		return $this;
	}
	public function getCategory()
	{
		return $this->category;
	}
	public function setCategoryid($categoryid)
	{
		$this->categoryid=$categoryid;
		return $this;
	}
	public function getCategoryid()
	{
		return $this->categoryid;
	}
	public function setCategoryRow($categoryrow)
	{
		$this->categoryrow = $categoryrow;
		return $this;
	}
	public function getCategoryRow()
	{
		if ($this->categoryrow!=null)
		{
			return $this->categoryrow;
		}
		$categoryrow=new Model_Category_Row();
		$this->setCategoryRow($categoryrow);
		return $categoryrow;
	}
	public function gridAction()
		{
			try {
					$query = "SELECT * FROM `category`";
		     		$category=$this->getCategoryRow()->fetchAll($query);
		     		 if (!$category) {
		      				throw new Exception("DAta not Found", 1);
		     		 }
		     		 // $this->setCategory($category);
		     		 $this->getView()->setTemplete('category/grid.phtml')->setData(['category' => $category])->render();
				
					} catch (Exception $e) {
					$message = new Model_Core_Message();
					$message->addMessages("Data not posted", Model_Core_Message::FAILURE);
	 	       	    $this->redirect("index.php?a=grid&c=category");
				}
	  }
	public function addAction()
	{
		$modelCetegory = Ccc::getModel('Category');
		$modelCetegoryRow = Ccc::getModel('Category_Row');
		$sql = "SELECT * FROM `category` ORDER BY `category`.`parent_id` ASC";
		$categoriesData = $modelCetegoryRow->fetchAll($sql);
		if(!$categoriesData)
		{
			throw new Exception("data not found.", 1);
		}
		$this->getView()->setTemplete('category/edit.phtml')->setData(['category'=>$modelCetegoryRow,'categoriesData'=>$categoriesData]);
		$this->render();
	}
	
	 public function editAction()
	{echo "<pre>";
		$categoryRow = Ccc::getModel('Category_Row');
		$request = $this->getRequest();
		$id=(int)$request->getParam('category_id');
		if(!isset($id))
		{
		throw new Exception("invalid cetegory id.", 1);
		}

		$category = $categoryRow->load($id);
		// print_r($category);
		$query = "SELECT * FROM `category` WHERE `path` NOT LIKE '{$category->path}=%' AND `path` NOT LIKE '{$category->path}';";
		// print_r($query);
		$categories = $categoryRow->fetchAll($query);
		print_r($categories);
		// if(!$categories)
		// {
		// 	throw new Exception("data not found.", 1);
		// }
		$this->getView()->setTemplete('category/edit.phtml')->setData(['category'=>$category,'categoriesData'=>$categories]);
		$this->render();
	}
	 
	  public function saveAction()
	{
		try 
		{echo "<pre>";
			$request = $this->getRequest();
			if (!$request)
			{
				throw new Exception("invalid Request.", 1);
			}

			$categoryData = $request->getPost('category');	
			// print_r($categoryData);
			if(!$categoryData)
			{
				throw new Exception("no data posted.", 1);
			}

			$modelRowCategory = Ccc::getModel('Category_Row');
			if($id = (int)$request->getParam('category_id'))
			{
				$categoryRow = $modelRowCategory->load($id);
				if (!$categoryRow)
				{
					throw new Exception("invalid id", 1);
				}
				$categoryData['category_id'] =$categoryRow->category_id ;
				$categoryData['path'] =$categoryRow->path ;
			}
			$category = $modelRowCategory->setData($categoryData);
			$result =$modelRowCategory->save();
				print_r($result);

			// if(!$result)
			// {
			// 	throw new Exception("unable to save Category", 1);
			// }
			if(!$id)
			{
				echo "string";
			$category->category_id = $result;
			}
			$category->updatePath();
			print_r($category->updatePath());
			$this->getMessage()->addMessage('Category saved successfully.',  Model_Core_Message::SUCCESS);

		
		
			} catch (Exception $e) {
				$message = new Model_Core_Message();
	  	     $message->addMessages($e->getMessage(),Model_Core_Message::FAILURE);
				// $this->redirect("index.php?a=grid&c=category");
			}
		}
	
	   public function deleteAction()
	   {
	   	try {
	   	    $request=$this->getRequest();
	   	    if (!$request) {
	   	    	throw new Exception("Invalid Request", 1);
	   	    }
	   	    $id = $request->getParam('category_id');
	   	    if (!$id) {
	   	    	throw new Exception("Data not found for delete", 1);
	   	    }
	   	    $this->getCategoryRow()->load($id);
	   	    $this->getCategoryRow()->delete();
	   	    $message = new Model_Core_Message();
	   	    $message->addMessages("Row Deleted Successfully..", Model_Core_Message::SUCCESS);
	 	    $this->redirect("index.php?a=grid&c=category");
	   		
	   	} catch (Exception $e) {
	   		$message = new Model_Core_Message();
	   	    $message->addMessages("Row Not Deleted ..", Model_Core_Message::FAILURE);
	 	    $this->redirect("index.php?a=grid&c=category");
	   	}
	   }
	}
	?>