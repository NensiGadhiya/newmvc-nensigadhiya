<?php
/**
*
*/
class Block_CustomerAddress_Grid extends Block_Core_Templete
{
	public function __construct()
	{
		parent::__construct();
		$this->setTemplete('customer/grid.phtml');
	}
	

	public function getCollection()
	{
		// echo "<pre>";
		$row = Ccc::getModel("CustomerAddress");
		$query = "SELECT * FROM `customer_address`";
		$customerAddress = $row->fetchAll($query);
		// print_r($customers);
		return $customerAddress;
		
	}
}