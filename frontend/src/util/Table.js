import React, {useState} from "react";
import * as XLSX from "xlsx";
import CurrencyFormat from "react-currency-format";
import StatusList from "../data/order/StatusList";
import DateFormatter from "./DateFormatter";
import {Link} from "react-router-dom";
import {Button, Modal} from "react-bootstrap";
import axios from "axios";
import {toast} from "react-toastify";

const Table = ({data,header,title}) => {
    const [dropdownOpen, setDropdownOpen] = useState(false);
    const [dataset, setDataSet] = useState(data);
    const [headerTable, setheaderTable] = useState(header);
    const [refresh, setRefreshTable] = useState(false);
    const [showDeleteModal, setShowDeleteModal] = useState(false);
    const [selectedItems, setSelectedItems] = useState([]);
    const [isAllSelected, setIsAllSelected] = useState(false);
    const handleSelectAll = () => {
        if (isAllSelected) {
            setSelectedItems([]);
        } else {
            setSelectedItems(dataset.map(item => item.id));
        }
        setIsAllSelected(!isAllSelected);
    };
    const handleItemSelection = (itemId) => {
        if (selectedItems.includes(itemId)) {
            setSelectedItems(selectedItems.filter((id) => id !== itemId));
        } else {
            setSelectedItems([...selectedItems, itemId]);
        }
        console.log(selectedItems)
    };
    const notify = () => {
        toast.success('Xoá thành công', {
            position: "top-right",
            autoClose: 5000,
            hideProgressBar: false,
            closeOnClick: true,
            pauseOnHover: true,
            draggable: true,
            progress: undefined,
            theme: "colored",
        });
    }

    const handleClearSelection = () => {
        if (selectedItems.length < 2) {
            setSelectedItems([]);
        } else {
            setSelectedItems([...selectedItems]);
        }
        console.log(selectedItems)
    };
    const deleteMultipleOrders = async () => {
        try {
            await axios.delete('http://localhost:8080/api/v1/order/delete/orders', {data: selectedItems});
            // Cập nhật lại danh sách đơn hàng sau khi xóa
            setRefreshTable(prev => !prev);

            // Gọi lại hook bằng cách thay đổi refreshTable
            setShowDeleteModal(false);
            notify()

            // const updatedOrders = orders.filter((o) => o.id !== orderToDelete.id);
            // setOrders(updatedOrders);
        } catch (error) {
            console.error('Error deleting orders:', error);
        }
    };

    const toggleDropdown = () => {
        setDropdownOpen(prevState => !dropdownOpen);
    };
    const [searchTerm, setSearchTerm] = useState('');
    const [currentPage, setCurrentPage] = useState(1);
    const [itemPerPage,setItemPerPage] = useState(5);

    // Tìm kiếm đơn hàng
    const filteredOrders = dataset.filter((order) => {
        const itemValues = Object.values(order).join(' ').toLowerCase();
        return itemValues.includes(searchTerm.toLowerCase());
    });

    // Lấy danh sách đơn hàng cho trang hiện tại
    const indexOfLast = currentPage * itemPerPage;
    const indexOfFirst = indexOfLast - itemPerPage;
    const currentItems = filteredOrders.slice(indexOfFirst, indexOfLast);

    // Chuyển trang
    const paginate = (pageNumber) => setCurrentPage(pageNumber);

    // Render số trang
    const pageNumbers = [];
    for (let i = 1; i <= Math.ceil(filteredOrders.length / itemPerPage); i++) {
        pageNumbers.push(i);
    }

    const handleSearch = (event) => {
        setSearchTerm(event.target.value);
        setCurrentPage(1); // Đặt lại trang hiện tại về 1 khi tìm kiếm
    };


    const onExportExcel = () => {
        const worksheet = XLSX.utils.json_to_sheet(dataset);
        const workbook = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(workbook, worksheet, 'Orders');
        XLSX.writeFile(workbook, 'orders.xlsx');
    };

    return (
        <div className={"mt-5"}>
            <div className="btn-group dropend no-print mb-2 mr-2">
                <button type="button" className="btn btn-primary dropdown-toggle" onClick={toggleDropdown}>
                    Công cụ
                </button>
                <ul className={`dropdown-menu tool ${dropdownOpen ? "show" : ""}`}>
                    <li className="dropdown-item "><a>In</a></li>
                    <li className="dropdown-item" onClick={onExportExcel}><a>Xuất ra exel</a></li>

                </ul>
            </div>
            <button className={"btn btn-danger mb-2"} onClick={() => setShowDeleteModal(true)}>Xóa nhiều
            </button>

            <div className={"d-flex align-items-center mb-3"}>
                <p className={"m-0"}>Hiển thị:</p>
                <select className="form-select col-1" onChange={(e) => setItemPerPage(e.target.value)}>
                    <option selected value="5">5</option>
                    <option value="2">10</option>
                    <option value="3">25</option>
                </select>
                <input className="form-control ms-auto me-2 col-4" type="search" placeholder="Search"
                       aria-label="Search"
                       onChange={handleSearch}/>
            </div>

            <table className={"table text-left"}>
                <thead>
                <tr>
                    <th><input type={"checkbox"} onClick={() => handleSelectAll()}/></th>
                    <th>ID</th>
                    <th>Tên khách hàng</th>
                    <th>Địa chỉ</th>
                    <th>SĐT</th>
                    <th>Tổng tiền</th>
                    <th>Thanh toán</th>
                    <th>Tình trạng đơn</th>
                    <th>Trạng thái đơn</th>
                    <th>Ngày đặt</th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                {currentItems.length === 0 ? <p>Không có dữ liệu</p> :

                    <tbody>
                    {currentItems && currentItems.map((order) => (
                        <tr key={order.id}>
                            <th><input className={"mt-4"} type={"checkbox"}
                                       checked={selectedItems.includes(order.id)}
                                       onChange={() => handleItemSelection(order.id)}/></th>
                            <td>{order.id}</td>
                            <td>{order.fullname}</td>
                            <td>{order.numberHouse + "/" + order.ward + "/" + order.district + "/" + order.province}</td>

                            <td className="text-center">{order.user.phoneNumber}</td>
                            <CurrencyFormat value={order.totalAmount} displayType={'text'} thousandSeparator={true}
                                            renderText={value =>
                                                <td className="text-center">{value}</td>}/>
                            <td className="text-center">{order.paymentMethod}</td>
                            <td className="text-center">
                                <select className="custom-select">
                                    <option value="ready_to_pick">Chờ xác nhận</option>
                                    {StatusList.map(status => (
                                        <option value={status.status}>{status.value}</option>
                                    ))}
                                </select>
                            </td>
                            <td className="text-center">
                                <button
                                    className={`btn ${order.paied ? "btn-light" : "btn-info"}`}>{order.paied ? "Đã thanh toán" : "Chưa thanh toán"}</button>
                            </td>
                            <td className="text-center">{DateFormatter(order.createdAt)}</td>

                            <td className="text-center">

                                <Link to={`/admin/order-management/order/${order.id}`}><Button
                                    variant="success">Xem</Button></Link>

                            </td>
                            <td className="text-center">
                                <Button
                                    variant="danger"
                                    onClick={() => {
                                        // handleDeleteOrder(order.id)
                                        setShowDeleteModal(true)
                                        handleItemSelection(order.id)
                                    }}
                                    className="btn-delete"
                                >
                                    Xóa
                                </Button>
                            </td>
                        </tr>
                    ))}
                    </tbody>
                }
            </table>
            <nav className={"d-flex justify-content-end"}>
                <ul className="pagination">
                    {pageNumbers.map((number) => (
                        <li key={number} className="page-item">
                            <a
                                onClick={() => paginate(number)}
                                href="#"
                                className="page-link"
                            >
                                {number}
                            </a>
                        </li>
                    ))}
                </ul>
            </nav>
            <Modal show={showDeleteModal} onHide={() => setShowDeleteModal(false)}>
                <Modal.Header closeButton>
                    <Modal.Title>Xóa đơn hàng</Modal.Title>
                </Modal.Header>
                <Modal.Body>Bạn có chắc chắn muốn xóa đơn hàng này?</Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={() => {
                        handleClearSelection()
                        setShowDeleteModal(false)

                    }}>
                        Hủy
                    </Button>
                    <Button variant="primary" onClick={deleteMultipleOrders}>
                        Xóa
                    </Button>
                </Modal.Footer>
            </Modal>
        </div>

    )
}