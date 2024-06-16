import mysql from 'mysql2/promise';
import 'dotenv/config'

const db = mysql.createPool({
    host:'localhost',
    user:'root',
    password:"",
    database:"summitsafety",
})

async function testConnection() {
    try{
        await db.getConnection()
        console.log("Koneksi ke database berhasil!");
    }catch(error){
        console.log("Gagal terhubung ke database:", error)
    }
}

async function query (command, values){
    try{
        const [value] = await db.query(command, values ??[])
        return value;
    }catch(error){
        console.error(error)
    }
}

export {query, testConnection};