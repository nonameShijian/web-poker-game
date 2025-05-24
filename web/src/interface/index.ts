export interface Result<T> {
  code: number;
  data: T;
  message: string;
}

export interface User {
  userId: number;
  /**
   * 登录用户名
   */
  username: string;
  /**
   * 性别：0-男，1-女，默认0
   */
  sex: number;
  /**
   * 加密后的密码
   */
  password: string;
  /**
   * 用户头像图片数据
   */
  photo: any;

  /**
   * 账户状态：0-禁用，1-正常，默认1
   */
  status: number;

  /**
   * 角色：0-普通用户，1-管理员
   */
  role: number;

  /**
   * 用户邮箱地址
   */
  email: string;
}

export interface Room {
  /**
   * 房间内玩家列表
   */
  players: User[];
  /**
   * 房间ID
   */
  roomId: number;
  /**
   * 房间创建者ID
   */
  ownerId: number;

  /**
   * 最大玩家数（固定4人）
   */
  maxPlayers: number;

  /**
   * 当前玩家数
   */
  currentPlayers: number;

  /**
   * 房间创建时间
   */
  createdAt: Date;
  /**
   * 房间状态：0-等待中，1-游戏中，默认0
   */
  status: number;
}

export interface WsData {
  action: "user_list" | "room_list" | "heart_beat" | "msg_error" | "create_room" |"join_room" | "update_data" |
  "leave_room" | "start_game" | "start_game_request";
  data: any;
  message?: string;
  timestamp: number;
}

export interface Card {
  suit: 'hearts' | 'diamonds' | 'spades' | 'clubs';
  point: 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15;
}