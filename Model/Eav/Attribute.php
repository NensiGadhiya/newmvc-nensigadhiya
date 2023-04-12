<?php

/**
 * 
 */
class Model_Eav_Attribute extends Model_Core_Table
{
	function __construct()
	{
		$this->setResourceClass('Model_Eav_Attribute_Resource');
		$this->setCollectionClass('Model_Eav_Attribute_Collection');
	}

	public function getStatus()
	{
	if($this->status)
	{
		return $this->status; 
	}
	return Model_Product::STATUS_DEFAULT;
	}

	public function getStatusText()
	{
		$statuses = $this->getResource()->getStatusOptions();
		if (array_key_exists($this->status, $statuses))
		{
			return $statuses[$this->status];
		}
			return $statuses[ Model_Product::STATUS_DEFAULT];
	}
}