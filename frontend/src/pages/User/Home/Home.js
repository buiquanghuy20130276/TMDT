import ListProductCategory from "./ListProductCategory";
import {useEffect, useState} from "react";
import axios from "axios";

function Home() {
    const heroData = [
        {text1: "Laptop", text2: "ở đâu?"},
        {text1: "Thì rẻ", text2: "Mà lại bềnh"},
        {text1: "Hãy đến với", text2: "Chúng tôi"}
    ]
    const [categorys, setCategorys] = useState([]);


    useEffect(() => {
        const fetchCategory = async () => {

            try {
                const res = await axios.get("http://localhost:8080/api/v1/category/all")
                setCategorys(res.data)
            } catch
                (error) {
                console.error('Error fetching data:', error);
            }
        }
        fetchCategory()

    }, []);
    console.log(categorys)


    return (
        <div className="wrapper">
            <div className="big-banner mt-100 pb-85 mt-sm-60 pb-sm-45">
                <div className="container banner-2">
                    <div className="banner-box">
                        <div className="col-img">
                            <a href="#"><img src="/assets/img/banner/banner3-1.jpg" alt="banner 3"/></a>
                        </div>
                        <div className="col-img">
                            <a href="#"><img src="/assets/img/banner/banner3-2.jpg" alt="banner 3"/></a>
                        </div>
                    </div>
                    <div className="banner-box">
                        <div className="col-img">
                            <a href="#"><img src="/assets/img/banner/banner3-3.jpg" alt="banner 3"/></a>
                        </div>
                    </div>
                    <div className="banner-box">
                        <div className="col-img">
                            <a href="#"><img src="/assets/img/banner/banner3-4.jpg" alt="banner 3"/></a>
                        </div>
                        <div className="col-img">
                            <a href="#"><img src="/assets/img/banner/banner3-5.jpg" alt="banner 3"/></a>
                        </div>
                    </div>
                    <div className="banner-box">
                        <div className="col-img">
                            <a href="#"><img src="/assets/img/banner/banner3-6.jpg" alt="banner 3"/></a>
                        </div>
                    </div>
                    <div className="banner-box">
                        <div className="col-img">
                            <a href="#"><img src="/assets/img/banner/banner3-7.jpg" alt="banner 3"/></a>
                        </div>
                        <div className="col-img">
                            <a href="#"><img src="/assets/img/banner/banner3-8.jpg" alt="banner 3"/></a>
                        </div>
                    </div>
                </div>
            </div>
            <div className="arrivals-product pb-85 pb-sm-45">
                <div className="container">
                    <div className="main-product-tab-area">
                        {categorys.map(category => (
                            <ListProductCategory value={category}/>
                        ))}
                    </div>
                </div>
            </div>

        </div>
    )
}

export default Home;