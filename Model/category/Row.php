<?php 

class Model_Category_Row  extends Model_Core_Table_Row
{
	public $tableclass = "Model_Category";
    function __construct()
	{
		parent::__construct();
	}

	public function getStatus()
	{
		if($this->status)
		{
			return $this->status; 
		}
		return Model_Cetegory::STATUS_DEFAULT;
	}

	public function getStatusText()
	{
		$statuses = $this->getTable()->getStatusOptions();
		if (array_key_exists($this->status, $statuses))
		{
			return $statuses[$this->status];
		}
			return $statuses[ Model_PaymentMethod::STATUS_DEFAULT];
	}

	public function updatePath()
	{
		echo "string";	
		if(!$this->getId())
		{
			return false;
		}
		print_r($this->parent_id);
		$parent = Ccc::getModel('Category_Row')->load($this->parent_id);
		// print_r($parent);
		$oldPath = $this->path;
		// var_dump($oldPath);
		if(!$parent)
		{
			$this->path = $this->getId(); 
		}
		else
		{
			$this->path =$parent->path.'='.$this->getId(); 
		}
		$this->save();
		echo $query = "UPDATE `category`
		SET `path` = REPLACE(`path`,'{$oldPath}=','{$this->path}=')
		WHERE `path` LIKE '{$oldPath}=%';";
		$this->getTable()->getAdapter()->update($query);
		return $this;
	}

	public function getPathName()
	{
		$path = explode('=', $this->path);
		$query = "SELECT `category_id`,`name` FROM `category`;";
		$categoryArray = $this->getTable()->getAdapter()->fetchPairs($query);
		foreach ($path as $id2 => &$value)
		{
			foreach ($categoryArray as $key => $id)
			{
				if($value == $key)
				{
					$value = $id ;
				}
			}
		}
		return implode('=>', $path);
	}
}

?>