from flask import Flask, render_template, jsonify
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)

# 連線設定
config = {
    'host': 'localhost',  
    'user': 'root',       
    'password': 'P@ssw0rd', 
    'database': 'my_titanic',
    'port': 3306
}

@app.route('/')
def index():
    connection = None
    cursor = None
    try:
        # 連到 MySQL
        connection = mysql.connector.connect(**config)
        cursor = connection.cursor(dictionary=True)

        # 查詢指令
        query = "SELECT * FROM full_passengers"
        cursor.execute(query)

        # 取得所有資料
        rows = cursor.fetchall()

        # return 給 HTML
        return render_template('index.html', rows=rows)

    except Error as e:
        print(f"資料庫錯誤: {e}")
        return jsonify({"error": "資料庫錯誤", "details": str(e)})

    except Exception as e:
        print(f"其他錯誤: {e}")
        return jsonify({"error": "發生未知錯誤", "details": str(e)})

    finally:
        # 關閉
        cursor.close()
        connection.close()

if __name__ == '__main__':
    app.run(debug=True)
    # app.run(debug=True, host='0.0.0.0', port=5000)
