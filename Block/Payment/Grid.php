<?php

/**
 *
 */
class Block_Payment_Grid extends Block_Core_Templete
{
	
	function __construct()
	{
		parent::__construct();
		$this->setTemplete('payment/grid.phtml');		
	}

	public function getCollection()
	{
		// echo "<pre>";
		$row = Ccc::getModel("Payment");
		$query = "SELECT * FROM `payment`";
		$payment = $row->fetchAll($query);
		// print_r($payment);
		return $payment;
		
	}
}