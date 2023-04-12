<?php
/**
*
*/
class Block_Shipping_Grid extends Block_Core_Templete
{
	public function __construct()
	{
		parent::__construct();
		$this->setTemplete('shipping/grid.phtml');
	}
	

	public function getCollection()
	{
		$row = Ccc::getModel("Shipping");
		$query = "SELECT * FROM `shipping`";
		$shippings = $row->fetchAll($query);
		// print_r($shippings);
		return $shippings;
		
	}
}