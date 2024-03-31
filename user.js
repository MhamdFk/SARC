const express=require('express');
const router=express.Router();
var db =require('./db.js');

router.route('/register').post((req,res)=>{
  //get params
var name =req.body.name;
var email =req.body.email;
var phone =req.body.phone;
var password =req.body.password;
var age =req.body.age;

//create query 
var sqlQuery="INSERT INTO user (name , email , phone , password , age) VALUES (?,?,?,?,?)"
//CALL DATA BASE TO INSERT OR INCLUDE DATABASE
//PASS ???? PARAMS HERE
db.query(sqlQuery,[name,email,password,phone,age],function(error,data,fields){

if(error){
  res.send(JSON.stringify({success:false,message:'register'}));
}else{
  res.send(JSON.stringify({success:true,message:'register'}));
}
});
});

router.route('/login').post((req,res)=>{
  var email=req.body.email;
  var password=req.body.password;

  var sql="SELECT * FROM user WHERE email=? AND password=?";

  //write agnin
  db.query(sql,[email,password],function(err,data,fields){
if (err){
  res.send(JSON.stringify({success:false,message:err}))
}
else{
  if(data.length>0){
    res.send(JSON.stringify({success:true,message:data}));
  }
  else{
    res.send(JSON.stringify({success:false,message:'empty data'}));
  }
}
  });
});
module.exports=router;