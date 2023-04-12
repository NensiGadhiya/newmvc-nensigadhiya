<?php

class Model_CustomerAddress_Resource extends Model_Core_Table_Resource	
{
	
	function __construct()
	{
		 $this->setTableName('customer_addresss');
	 	 $this->setPrimaryKey('address_id');
	}
}