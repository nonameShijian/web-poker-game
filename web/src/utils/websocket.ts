import { WsData } from "@/interface";
import { ElMessage } from "element-plus";

const wsEventTarget = new EventTarget(); // 用于组件监听消息事件

let ws: WebSocket | null = null;

/**
 * 初始化 WebSocket 连接
 * @param url WebSocket 地址
 */
export function initWebSocket(url: string): void {
  if (ws && ws.readyState === WebSocket.OPEN) {
    console.warn("WebSocket 已经存在");
    return;
  }

  ws = new WebSocket(url, /*[localStorage.getItem("accessToken")!]*/);

  ws.onopen = () => {
    console.log("WebSocket connection opened");
  };

  ws.onmessage = (event: MessageEvent) => {
    try {
      const data: WsData = JSON.parse(event.data);
      console.log("WebSocket 收到消息:", data);

      // 创建并派发自定义事件
      const customEvent = new CustomEvent("message", { detail: data });
      wsEventTarget.dispatchEvent(customEvent);
    } catch (error) {
      console.error("解析 WebSocket 消息失败", error);
    }
  };

  ws.onclose = () => {
    console.log("WebSocket connection closed");
    ws = null;
    location.reload();
  };

  ws.onerror = (error) => {
    console.error("WebSocket error:", error);
  };
}

/**
 * 发送 WebSocket 消息
 * @param message 消息体
 */
export function sendWebSocketMessage(message: WsData) {
  return new Promise((resolve, reject) => {
    if (!ws) {
      reject(new Error("WebSocket 未连接"));
      return;
    }
    switch (ws.readyState) {
      case WebSocket.OPEN:
        ws.send(JSON.stringify(message));
        resolve(null);
        break;
      case WebSocket.CONNECTING:
        ElMessage.info("WebSocket 正在连接中，将在5秒内连接成功后重试");
        // 信号
        const controller = new AbortController();
        setTimeout(() => {
          controller.abort();
          reject(new Error("WebSocket 连接超时"));
        }, 5000);
        ws.addEventListener("open", () => {
          console.log("WebSocket 连接成功，发送消息:", message);
          ws!.send(JSON.stringify(message));
          resolve(null);
        }, { once: true, signal: controller.signal });
        break;
      case WebSocket.CLOSING:
        reject(new Error("WebSocket 正在关闭中"));
        break;
      case WebSocket.CLOSED:
        reject(new Error("WebSocket 已关闭，请重新连接"));
        break;
    }
  });
}

/**
 * 关闭 WebSocket 连接
 */
export function closeWebSocket(): void {
  if (ws) {
    ws.close();
    ws = null;
  }
}

/**
 * 添加 WebSocket 消息监听器
 * @param listener 回调函数
 */
export function onWebSocketMessage(listener: (event: any) => void): void {
  wsEventTarget.addEventListener("message", listener);
}

/**
 * 移除 WebSocket 消息监听器
 * @param listener 回调函数
 */
export function offWebSocketMessage(listener: (event: any) => void): void {
  wsEventTarget.removeEventListener("message", listener);
}