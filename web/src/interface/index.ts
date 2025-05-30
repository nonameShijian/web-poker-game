export interface Result<T> {
  code: number;
  data: T;
  msg: string;
}

export interface User {
  /** 用户ID */
    userId: number;

    /** 部门ID */
    deptId: number;

    /** 用户账号 */
    userName: string;

    /** 用户昵称 */
    nickName: string;

    /** 用户邮箱 */
    email: string;

    /** 手机号码 */
    phonenumber: string;

    /** 用户性别, 0=男,1=女,2=未知 */
    sex: string;

    /** 用户头像 */
    avatar: string;

    /** 密码 */
    password: string;

    /** 帐号状态（0正常 1停用） */
    status: string;

    /** 删除标志（0代表存在 2代表删除） */
    delFlag: string;

    /** 最后登录IP */
    loginIp: string;

    /** 最后登录时间 */
    loginDate: Date;

    /** 部门对象 */
    dept: any;

    /** 角色对象 */
    roles: any[];

    /** 角色组 */
    roleIds:  number[];

    /** 岗位组 */
    postIds:  number[];

    /** 角色ID */
    roleId: number;
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