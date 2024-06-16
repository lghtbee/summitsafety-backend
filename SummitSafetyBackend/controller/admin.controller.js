import { query } from "../database/database/Connection.js";

export const getAdmin = async (req, res) => {
    try {
        const result = await query('SELECT * FROM admin');
        return res.status(200).json({ success: true, data: result });
    } catch (e) {
        console.log("Terjadi kesalahan", e);
        return res.status(500).json({ msg: "Terjadi kesalahan pada server" });
    }
};