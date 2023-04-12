<?php
class Controller_Customer extends Controller_Core_Action
{
	protected $customer = null;
	protected $customerid = null;
	protected $customerRow = null;
	protected $addressRow = null;
	
	public function setCustomer($customer)
	{
		$this->customer = $customer;
		return $this;
	}
	public function getCustomer()
	{
		return $this->customer;
	}
	public function setCustomerid($customerid)
	{
		$this->customerid = $customerid;
		return $this;
	}
	public function getCustomerid()
	{
		return $this->customerid;
	}
	public function setCustomerRow($customerRow)
	{
		$this->customerRow = $customerRow;
		return $this;
	}
	public function getCustomerRow()
	{
		if ($this->customerRow!=null)
		{
			return $this->customerRow;
		}
		$customerRow=new Model_Customer_Row();
		$this->setCustomerRow($customerRow);
		return $customerRow;
	}
	public function setAddressRow($modeladdress)
	{
		$this->modeladdress = $modeladdress;
		return $this;
	}
	public function getAddressRow()
	{
		if ($this->addressRow!=null)
		{
			return $this->addressRow;
		}
			$addressRow = new Model_Customer_Address_Row();
			$this->setAddressRow($addressRow);
			return $addressRow;
	}
	public function gridAction()
	{
		// try {
		// 	$customers = Ccc::getModel('Customer_Row');
		// 	$query ="SELECT * FROM `{$customers->getTable()->getTableName()}`";
		// 		$customer=$customers->fetchAll($query);
		// 	if (!$customer) {
		// 		throw new Exception("Data not found", 1);
		// 	}
		// 	$this->getView()->setTemplete("customer/grid.phtml")->setData(['customers' => $customer]);
		// 	$this->render();
		// 	} catch (Exception $e) {
		// 	$message = new Model_Core_Message();
		// 	$message->addMessages("Data not Posted", Model_Core_Message::FAILURE);
		// 	$this->redirect("index.php?a=grid&c=customer");
		// 	}

			$layout = $this->getLayout();
			$grid = new Block_Customer_Grid();
			$layout->getChild('content')->addChild('grid', $grid);
			$layout->render();

	}
	public function addAction()
	// {
	// 		$customers = Ccc::getModel('Customer_Resource');
	// 		$address = Ccc::getModel('CustomerAddress_Resource');
	// 		if (!$customers) {
	// 			throw new Exception("Id not found", 1);
	// 		}
	// 	$this->getView()->setTemplete("customer/edit.phtml")->setData(['customers'=>$customers,'address'=>$address]);
	// 	$this->render();

	// }

	{
	 	try {
				$layout = $this->getLayout();
				$customer = Ccc::getModel('Customer');
				$add = $layout->createBlock('Customer_Edit')->setData(['customer'=>$customer]);

				 $layout->getChild('content')->addChild('add', $add);

				$layout->render();
		
	 	} catch (Exception $e) {
	 		$message = new Model_Core_Message();
	 	 $message->addMessages("Data not found..",Model_Core_Message::FAILURE);
	 	 $this->redirect("index.php?a=grid&c=customer");
	 	}
	}
	
	public function editAction()
	{
		$customers = Ccc::getModel('Customer_Row');
		try {
				$request=$this->getRequest();
		if (!$request->isGet()){
		throw new Exception("Invalid Request", 1);
		}
		$id = $request->getParam('customer_id');
		if (!$id) {
		throw new Exception("Id Not Found", 1);
		}

		$query = "SELECT * FROM `customer_address` WHERE `customer_id` = '$id'";
		$address = Ccc::getModel('CustomerAddress_Row')->fetchRow($query);

		$customer=$customers->load($id);
		if (!$customer) {
		throw new Exception("Data not posted ", 1);
		}
		$this->getView()->setTemplete("customer/edit.phtml")->setData(['customers' =>$customer,'address'=>$address]);
		$this->render();
		
		} catch (Exception $e) {
		$message = new Model_Core_Message();
		$message->addMessages("Data not found", Model_Core_Message::FAILURE);
		$this->redirect("index.php?a=grid&c=customer");
		}
	}
	

	public function saveAction()
	{
		try 
		{
			$request=$this->getRequest();
			$modelCustomer = Ccc::getModel('Customer_Row');
			$modelCustomerAddress = Ccc::getModel('CustomerAddress_Row');
			if (!$request->isPost())
			{
				throw new Exception("invalid Request.", 1);
			}
			$customer = $request->getPost('customer');
			$customerAddress = $request->getPost('customerAdd');


			$id = $request->getParam('customer_id');
			
			if($id){
				$customerRow = $modelCustomer->load($id);

				if(!$customerRow)
				{
					throw new Exception("invalid id.", 1);
				}
				$customerAddress['customer_id'] = $id;
				$customer['customer_id'] = $id;
			$customer['update_at']  = date('Y-m-d h:i:sa');
				
			}
			$insertCustomer = $modelCustomer->setData($customer)->save();
			if (!$id) {
			$customerAddress['customer_id'] = $insertCustomer->customer_id;
			}


			if ($id) {
				
			$query = "SELECT * FROM `customer_address` WHERE `customer_id` = '$id'";
				$customerAddressRow = $modelCustomerAddress->fetchRow($query);
			$customerAddress['address_id'] = $customerAddressRow->address_id;
			// $customerAddress['update_at'] = date("Y-m-d h:i:s");


			}

			$insertCustomerAddress = $modelCustomerAddress->setData($customerAddress)->save();
			
	  	    $message = new Model_Core_Message();
	  	     $message->addMessages("Data saved Successfully..",Model_Core_Message::SUCCESS);
	 		// $this->redirect("index.php?a=grid&c=customer");
		}
		catch (Exception $e)
		{
			$message = new Model_Core_Message();
	  	     $message->addMessages($e->getMessage(),Model_Core_Message::FAILURE);
	 		// $this->redirect("index.php?a=grid&c=customer");
		}
	}
	public function deleteAction()
	{
	try {
	$request = $this->getRequest();
	if (!$request->isGet()) {
	throw new Exception("Invalid Request", 1);
	}
	$id = $request->getParam('customer_id');
	if (!$id) {
	throw new Exception("Id Not Found", 1);
	}
	    $this->getCustomerRow()->load($id);
	    $this->getCustomerRow()->delete();
	    $message = new Model_Core_Message();
	    $message->addMessages("Row Delete Successfully..",Model_Core_Message::SUCCESS);
	 $this->redirect("index.php?a=grid&c=customer");
	
	} catch (Exception $e) {
	$message = new Model_Core_Message();
	    $message->addMessages("Row Not Delete..",Model_Core_Message::FAILURE);
	 $this->redirect("index.php?a=grid&c=customer");
	}
	
	}
	}
	?>