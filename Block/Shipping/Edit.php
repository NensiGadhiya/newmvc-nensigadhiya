<?php

/**
 * 
 */
class Block_Shipping_Edit extends Block_Core_Templete
{
	
	function __construct()
	{
		parent::__construct();
		$this->setTemplete('shipping/edit.phtml');
	}
}