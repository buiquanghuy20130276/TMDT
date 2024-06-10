import MUIDataTable from "mui-datatables";
import React, {useState} from "react";
import ReactDOM from "react-dom";
import {ThemeProvider} from "@mui/material/styles";
import {createTheme} from "@mui/material/styles";
import InputLabel from "@mui/material/InputLabel";
import MenuItem from "@mui/material/MenuItem";
import FormControl from "@mui/material/FormControl";
import Select from "@mui/material/Select";
import {CacheProvider} from "@emotion/react";
import createCache from "@emotion/cache";

const muiCache = createCache({
    key: "mui-datatables",
    prepend: true
});

function DataTable() {
    const [optionControlls, setOptionControlls] = useState({
        responsive: "vertical",
        tableBodyHeight: "400px",
        tableBodyMaxHeight: "",
        searchBtn: true,
        downloadBtn: true,
        printBtn: true,
        viewColumnBtn: true,
        filterBtn: true
    })

    const columns = [
        {name: "Name", options: {filterOptions: {fullWidth: true}}},
        "Title",
        "Location"
    ];

    const options = {
        search: optionControlls.searchBtn,
        download: optionControlls.downloadBtn,
        print: optionControlls.printBtn,
        viewColumns: optionControlls.viewColumnBtn,
        filter: optionControlls.filterBtn,
        filterType: "dropdown",
        responsive: optionControlls.responsive,
        tableBodyMaxHeight: optionControlls.tableBodyMaxHeight,
        onTableChange: (action, state) => {
            console.log(action);
            console.dir(state);
        }
    };

    const data = [
        ["Gabby George", "Business Analyst", "Minneapolis"],
        [
            "Aiden Lloyd",
            "Business Consultant for an International Company and CEO of Tony's Burger Palace",
            "Dallas"
        ],
        ["Jaden Collins", "Attorney", "Santa Ana"],
        ["Franky Rees", "Business Analyst", "St. Petersburg"],
        ["Aaren Rose", null, "Toledo"],
        ["Johnny Jones", "Business Analyst", "St. Petersburg"],
        ["Jimmy Johns", "Business Analyst", "Baltimore"],
        ["Jack Jackson", "Business Analyst", "El Paso"],
        ["Joe Jones", "Computer Programmer", "El Paso"],
        ["Jacky Jackson", "Business Consultant", "Baltimore"],
        ["Jo Jo", "Software Developer", "Washington DC"],
        ["Donna Marie", "Business Manager", "Annapolis"]
    ];

    return (
        <CacheProvider value={muiCache}>
            <ThemeProvider theme={createTheme()}>

                <MUIDataTable
                    title={"ACME Employee list"}
                    data={data}
                    columns={columns}
                    options={options}
                />
            </ThemeProvider>
        </CacheProvider>
    );
}

export default DataTable