const express = require('express');
const file = require('xlsx');
const app = express();
const File = file.readFile('templateShedule.xlsx');
const mysql = require('mysql');
const Data =[];
let getData =[];
app.use(express.json());



const pool = mysql.createPool({
     connectionLimit:10,
     host           :'localhost',
     user           :'root',
     password       :'',
     database       : 'assignment1'

});

app.get("/display",(req,res)=>{
     pool.getConnection((err,connect)=>{
         if(err){console.log(err);}
         connect.query('SELECT * from templatedb',(err,rows)=>{
              if(!err){res.send(rows);}
              else{console.log(err);}
         })
     })
});

app.get("/",(req,res)=>{
    //  console.log("The File is",File);
      const sheet = File.SheetNames;
      for(let i=0;i<sheet.length;i++){
          const sheetname = sheet[i];
          const sheetData = file.utils.sheet_to_json(File.Sheets[sheetname]);
          sheetData.forEach((data)=>{
                 Data.push(data);
          });
      }
  
      const [date,empid,name,worktype,stdate,endt,storid,storname] = Object.values(Data[0]);
      console.log(date,empid,name,worktype,stdate,endt,storid,storname);
    

       for(let i=0;i<Data.length;i++){
            const [date,empid,name,worktype,stdate,endt,storid,storname] = Object.values(Data[i]);
            console.log(date,empid,name,worktype,stdate,endt,storid,storname);
            pool.getConnection((err,connect)=>{
                if(err){console.log(err);}
                if(storid === undefined && storname === undefined){
                    connect.query(`INSERT INTO templatedb(date,employeeid,name,workingtype,starttime,end)values("${date}","${empid}","${name}","${worktype}","NULL","NULL")`,(err)=>{
                        if(err){console.log(err);}
                        connect.release();
                   })
                }
                else if(stdate === undefined && endt === undefined && storid === undefined && storname === undefined){
                    connect.query(`INSERT INTO templatedb(date,employeeid,name,workingtype)values("${date}","${empid}","${name}","${worktype}")`,(err)=>{
                        if(err){console.log(err);}
                        connect.release();
                   })
                }
                else{
                connect.query(`INSERT INTO templatedb(date,employeeid,name,workingtype,starttime,end,storeid,storename) VALUES ("${date}","${empid}","${name}","${worktype}","${stdate}","${endt}","${storid}","${storname}")`,(err)=>{
                     if(err){console.log(err);}
                     connect.release();
                })
            }
            })
        }
  });






app.listen(3000);
