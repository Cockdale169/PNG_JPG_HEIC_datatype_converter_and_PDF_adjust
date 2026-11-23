import http.server
import socketserver
import webbrowser
import os
import sys

PORT = 8899
DIRECTORY = os.path.dirname(os.path.abspath(__file__))

class QuietHandler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIRECTORY, **kwargs)
    
    def log_message(self, format, *args):
        # 靜音存取 log，維持終端機乾淨
        pass

def main():
    os.chdir(DIRECTORY)
    # 允許地址重複使用以避免重啟時被卡住
    socketserver.TCPServer.allow_reuse_address = True
    try:
        with socketserver.TCPServer(("", PORT), QuietHandler) as httpd:
            print(f"=====================================================")
            print(f"⚡ 個人轉檔與 PDF 編排工作台已啟動！")
            print(f"🌐 瀏覽器網址: http://localhost:{PORT}")
            print(f"⭐ 請在瀏覽器按下 Ctrl + D 即可將其存為書籤即點即用！")
            print(f"=====================================================")
            
            # 自動在瀏覽器開啟
            webbrowser.open(f"http://localhost:{PORT}")
            httpd.serve_forever()
    except OSError as e:
        if "address already in use" in str(e).lower() or e.errno == 10048:
            print(f"提示: 服務已在 http://localhost:{PORT} 運行中，正在開啟瀏覽器...")
            webbrowser.open(f"http://localhost:{PORT}")
        else:
            print(f"啟動錯誤: {e}")

if __name__ == "__main__":
    main()
