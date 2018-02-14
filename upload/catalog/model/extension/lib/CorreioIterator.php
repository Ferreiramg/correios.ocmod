<?php

class CorreioIterator implements Iterator, Countable
{
    private $data;
    private $pointer = 0;
    public $model;
    public $total = 0;

    public function __construct(array $data, Model $model)
    {
        $this->model = $model;
        $this->data = $data;
    }

    /**
     * Return the current element
     * @link http://php.net/manual/en/iterator.current.php
     * @return mixed Can return any type.
     * @since 5.0.0
     */
    public function current()
    {
        $data = $this->data[$this->pointer];
        /*
         * convert MM to CM / G to Kg
         * */
        $data['weight'] = $this->model->weight->convert($data['weight'], $this->model->config->get('config_weight_class_id'), 1);
        $data['height'] = (float)$this->model->length->convert($data['height'], $this->model->config->get('config_length_class_id'), $data['length_class_id']);
        $data['width'] = (float)$this->model->length->convert($data['width'], $this->model->config->get('config_length_class_id'), $data['length_class_id']);
        $data['length'] = (float)$this->model->length->convert($data['length'], $this->model->config->get('config_length_class_id'), $data['length_class_id']);

        //$data['weight'] = (float)$limits['max_peso'] < $data['weight']?$data['weight']:$limits['max_peso'];

        $data['height'] = round(($data['height'] * (int)$data['quantity']) / 100, 1);
        $data['width'] = round($data['width'] / 100, 2);
        $data['length'] = round($data['length'] / 100, 2);

        return $data;
    }

    /**
     * Move forward to next element
     * @link http://php.net/manual/en/iterator.next.php
     * @return void Any returned value is ignored.
     * @since 5.0.0
     */
    public function next()
    {
        ++$this->pointer;
    }

    /**
     * Return the key of the current element
     * @link http://php.net/manual/en/iterator.key.php
     * @return mixed scalar on success, or null on failure.
     * @since 5.0.0
     */
    public function key()
    {
        return $this->pointer;
    }

    /**
     * Checks if current position is valid
     * @link http://php.net/manual/en/iterator.valid.php
     * @return boolean The return value will be casted to boolean and then evaluated.
     * Returns true on success or false on failure.
     * @since 5.0.0
     */
    public function valid()
    {
        return isset($this->data[$this->pointer]) && intval($this->data[$this->pointer]['shipping']) > 0;
    }

    /**
     * Rewind the Iterator to the first element
     * @link http://php.net/manual/en/iterator.rewind.php
     * @return void Any returned value is ignored.
     * @since 5.0.0
     */
    public function rewind()
    {
        $this->pointer = 0;
    }

    /**
     * Count elements of an object
     * @link http://php.net/manual/en/countable.count.php
     * @return int The custom count as an integer.
     * </p>
     * <p>
     * The return value is cast to an integer.
     * @since 5.1.0
     */
    public function count()
    {
        return count($this->data);
    }

}