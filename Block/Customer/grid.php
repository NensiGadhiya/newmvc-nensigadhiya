<?php
/**
*
*/
class Block_Customer_Grid extends Block_Core_Templete
{
	public function __construct()
	{
		parent::__construct();
		$this->setTemplete('customer/grid.phtml');
	}
	

	public function getCollection()
	{
		// echo "<pre>";
		$row = Ccc::getModel("Customer");
		$query = "SELECT * FROM `customer`";
		$customers = $row->fetchAll($query);
		// print_r($customers);
		return $customers;
		
	}
}