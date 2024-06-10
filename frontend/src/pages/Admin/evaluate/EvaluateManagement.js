import {ToastContainer} from "react-toastify";
import CurrencyFormatter from "../../../util/CurrencyFormatter";
import DateFormatter from "../../../util/DateFormatter";
import {Link} from "react-router-dom";
import {Button, Modal, Form } from "react-bootstrap";
import React, {useState} from "react";

const EvaluateManagement = () => {
    const [showReplyModal, setShowReplyModal] = useState(false);
    const [selectedEvaluationId, setSelectedEvaluationId] = useState(null);
    const [replyContent, setReplyContent] = useState(""); // Thêm state để lưu nội dung trả lời

    const handleReplyClick = (evaluationId) => {
        setSelectedEvaluationId(evaluationId);
        setShowReplyModal(true);
    };

    const handleSendReply = () => {
        // Ở đây bạn có thể xử lý nội dung trả lời (replyContent)
        console.log("Nội dung trả lời:", replyContent);
        console.log("ID đánh giá:", selectedEvaluationId);

        // Sau khi xử lý, đóng Modal
        setShowReplyModal(false);

        // Reset nội dung trả lời
        setReplyContent("");
    };

return (
    <div className={"container-xl"}>

        <table className="table text-left">
            <thead>
            <tr>
                <th><input type="checkbox"/></th>
                <th>ID</th>
                <th>Mã đơn hàng</th>
                <th>Tên khách hàng</th>
                <th>Rating</th>
                <th>Chất lượng</th>
                <th>Nội dung</th>
                <th>Trả lời</th>
                <th>Ngày gửi đánh giá</th>
                <th></th>

                <th></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th><input className="mt-4" type="checkbox"/></th>
                <td>1</td>
                <td>1717401604940</td>
                <td>DANG VU HUNG</td>
                <td>aaa/Xã Lý Nhơn/Huyện Cần Giờ/Thành phố Hồ Chí Minh</td>
                <td className="text-center">0384941027</td>
                <td className="text-center"><span>90,000</span></td>
                <td className="text-center">offline</td>

                <td className="text-center">03-06-2024</td>
                <td className="text-center">
                    <button
                        type="button"
                        className="btn btn-success"
                        onClick={() => handleReplyClick(1717401604940)}
                    >
                        Trả lời
                    </button>
                </td>
                <td className="text-center">

                    <button type="button" className="btn btn-danger">Xo</button>
                </td>
            </tr>

            </tbody>
        </table>
        <Modal show={showReplyModal} onHide={() => setShowReplyModal(false)}>
            <Modal.Header closeButton>
                <Modal.Title>Trả lời đánh giá</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Form.Group controlId="replyContent">
                    <Form.Label>Nội dung trả lời:</Form.Label>
                    <Form.Control
                        as="textarea"
                        rows={3}
                        value={replyContent}
                        onChange={(e) => setReplyContent(e.target.value)}
                    />
                </Form.Group>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="secondary" onClick={() => setShowReplyModal(false)}>
                    Hủy
                </Button>
                <Button variant="primary" onClick={handleSendReply}>
                    Gửi
                </Button>
            </Modal.Footer>
        </Modal>
    </div>
);
}
export default EvaluateManagement;