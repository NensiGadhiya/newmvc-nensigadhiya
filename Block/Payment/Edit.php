<?php

/**
 *
 */
class Block_Payment_Edit extends Block_Core_Templete
{
	
	public function __construct()
	{
		parent::__construct();
		$this->setTemplete('payment/edit.phtml');
	}

	// public function createChild()
	// {
	// 	$row = Ccc::getModel('Payment_Row');
	//  	$request=$this->getRequest();
	//  	if (!$request) {
	//  		throw new Exception("Invalid Request", 1);
	//  	}
	//  	$id = $request->getParam('payment_id');
	//  	if (!$id) {
	//  		return $row;
	//  	}
	//  	$payment=$row->load($id);
	//  	return $payment;
	// }
}