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

  ws = new WebSocket(url);

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
export function sendWebSocketMessage(message: WsData): void {
  if (ws && ws.readyState === WebSocket.OPEN) {
    ws.send(JSON.stringify(message));
  } else {
    ElMessage.error("WebSocket 未连接或正在连接中");
  }
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