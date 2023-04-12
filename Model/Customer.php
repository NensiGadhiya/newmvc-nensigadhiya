<!-- <?php
// require_once 'Core/Table.php';

/**
 * 
 */
// class Model_Customer extends Model_Core_Table
// {
// 	const STATUS_ACTIVE = 1;
// 	const STATUS_ACTIVE_LBL ='Active';
// 	const STATUS_INACTIVE = 2;
// 	const STATUS_INACTIVE_LBL ='Inactive';
// 	const STATUS_DEFAULT =2;
	
	 // public $tablename ="customer";
	 // public $primarykey ="customer_id";

	//  public function getStatusOptions()
	// {
	// 	return[
	// 			self::STATUS_ACTIVE=>self::STATUS_ACTIVE_LBL,
	// 			self::STATUS_INACTIVE=>self::STATUS_INACTIVE_LBL,
		// ];
	// }
// }
?> -->


<?php
// require_once 'Core/Table.php';

/**
 * 
 */
class Model_Customer extends Model_Core_Table
{
	function __construct()
	{
		 $this->setResourceClass('Model_Customer_Resource');
	}
	
	 

	public function getStatus()
	{
		if($this->status)
		{
			return $this->status; 
		}
		return Model_Customer_Resource::STATUS_DEFAULT;
	}

	public function getStatusText()
	{
		$statuses = $this->getResource()->getStatusOptions();
		if (array_key_exists($this->status, $statuses))
		{
			return $statuses[$this->status];
		}
			return $statuses[ Model_Customer_Resource::STATUS_DEFAULT];
	}

	public function getShippingAddress()
	{
		
	}

	public function setShippingAddress($shippingAddress)
	{
		
	}
}

?>