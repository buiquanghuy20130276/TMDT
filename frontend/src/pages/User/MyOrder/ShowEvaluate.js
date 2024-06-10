import React, { useEffect, useState } from 'react';
import axios from 'axios';
import Rating from '@mui/material/Rating';
import {Button, Form, Modal} from "react-bootstrap";
import ReactStars from "react-rating-stars-component";

function ShowEvaluate({ show, handleClose, orderId, userId }) {


    return (
        <Modal show={show} onHide={handleClose}>
            <Modal.Header closeButton>
                <Modal.Title>Đánh giá cua ban</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Form>
                    <Form.Group>
                        <Form.Label><b>ID đơn hàng:</b> {orderId}</Form.Label>
                    </Form.Group>
                    <Form.Group className="d-flex justify-content-center align-items-center flex-column mb-2">

                        <Form.Label><b>Đánh giá</b></Form.Label>
                    </Form.Group>
                    <Form.Group className="d-flex justify-content-center align-items-center flex-column mb-2">

                        <Form.Label><b>Chat luong</b></Form.Label>
                    </Form.Group>
                    <Form.Group>
                        <Form.Label><b>Nhận xét của bạn</b></Form.Label>

                    </Form.Group>
                    <Form.Group>
                        <Form.Label><b>Thông báo từ cửa hàng</b></Form.Label>

                    </Form.Group>
                </Form>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="secondary" onClick={handleClose}>
                    Đóng
                </Button>

            </Modal.Footer>
        </Modal>
    );
}

export default ShowEvaluate;