<?php
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';
class Item extends REST_Controller {

    /**
     * Get All Data from this method.
     *
     * @return Response
     */
    public function __construct() {
        parent::__construct();
        $this->load->database();
        $this->timeZone = date_default_timezone_set('Asia/kolkata');
        $this->system_date = date("Y-m-d");
        $this->system_date_time = date("Y-m-d H:i:s");
    }

    /**
     * Get All Data from this method.
     *
     * @return Response
     */
    public function token_get() {
        $tokenData = array();
        $tokenData['id'] = 1; //TODO: Replace with data for token

        /* Date helper
         * https://www.codeigniter.com/user_guide/helpers/date_helper.html
         * Added helper "date" in application\config\autoload.php line 92
         * Notice - 'timestamp' is part of $tokenData
         */
        $tokenData['timestamp'] = now();

        $output['token'] = AUTHORIZATION::generateToken($tokenData);
        $this->set_response($output, REST_Controller::HTTP_OK);
    }

    public function index_get() {
        $headers = $this->input->request_headers();
        if (array_key_exists('Authorization', $headers) && !empty($headers['Authorization'])) {
            //TODO: Change 'token_timeout' in application\config\jwt.php
            $decodedToken = AUTHORIZATION::validateTimestamp($headers['Authorization']);

            // return response if token is valid
            if ($decodedToken != false) {
//                $this->response($decodedToken, REST_Controller::HTTP_OK);
                //return;

                $id = $this->input->get('item');
                if (!empty($id)) {
                    $data = $this->db->get_where("zone_division_header_all", ['id' => $id])->row_array();
                } else {
                    $data = $this->db->get("zone_division_header_all")->result();
                }
                if ($data) {
                    $this->response(['data' => $data, 'message' => 'success'], REST_Controller::HTTP_OK);
                    // $this->response($data, REST_Controller::HTTP_OK);
                } else {
                    $this->response($data, REST_Controller::HTTP_NO_CONTENT);
                }
            } else {
                $this->response("Unauthorised", REST_Controller::HTTP_UNAUTHORIZED);
            }
        } else
            $this->response("Unauthorised", REST_Controller::HTTP_UNAUTHORIZED);
    }

    public function indexData_post() {

        $data = array();
        $headers = $this->input->request_headers();
        if (array_key_exists('Authorization', $headers) && !empty($headers['Authorization'])) {
            //TODO: Change 'token_timeout' in application\config\jwt.php
            $decodedToken = AUTHORIZATION::validateTimestamp($headers['Authorization']);

            // return response if token is valid
            if ($decodedToken != false) {
                $id = $this->input->post('item');
                if (!empty($id)) {
                    $data = $this->db->get_where("zone_division_header_all", ['id' => $id])->row_array();
                } else {
                    $data = $this->db->get("zone_division_header_all")->result();
                }
                if ($data) {
                    $this->response(['data' => $data, 'message' => 'success'], REST_Controller::HTTP_OK);
                    //$this->response($data, REST_Controller::HTTP_OK);
                } else {
                    $this->response(NULL, REST_Controller::HTTP_NO_CONTENT);
                }
            } else {
                $this->response("Unauthorised", REST_Controller::HTTP_UNAUTHORIZED);
            }
        } else
            $this->response("Unauthorised", REST_Controller::HTTP_UNAUTHORIZED);
    }

    /**
     * Get All Data from this method.
     *
     * @return Response
     */
    public function index_post() {
        $input = $this->input->post();
        $this->db->insert('items', $input);

        $this->response(['Item created successfully.'], REST_Controller::HTTP_OK);
    }

    /**
     * Get All Data from this method.
     *
     * @return Response
     */
    public function index_put($id) {
        $input = $this->put();
        $this->db->update('items', $input, array('id' => $id));

        $this->response(['Item updated successfully.'], REST_Controller::HTTP_OK);
    }

    /**
     * Get All Data from this method.
     *
     * @return Response
     */
    public function index_delete($id) {
        $this->db->delete('items', array('id' => $id));

        $this->response(['Item deleted successfully.'], REST_Controller::HTTP_OK);
    }

}