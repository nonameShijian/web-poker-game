import JSEncrypt from '@/utils/jsencrypt.min'

const publicKey = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApPNigoBpWsoCEKYxLCRz'+
  '9JCXH80BULxaFRvWwUrbj47kwHN/y22x/a6PglxdZ470FRVmkSle+lLH/cfgPOvs'+
  'f+TvOM/NWpeha71BGE9SlnjD/OXJccM5dALU4bdfs2PkqujHmTCZf3oQht17pfWw'+
  '6z8e8tqz/nELWTl9kU1BgkCh/AeO/pjYDFYKaIboErIZb6hSnIDmj+v5R5T6vGPo'+
  'yIbzwwtx8NDjcDGh0xHmGeurBZ71mZ/M8LtwXcRNDWnZu8bb8hVZXoVskqIH4a/Z'+
  'UGFoWISzi9QLujpFs8KTMfeLDSS3Ljs58OSuVNc4jxaAhEtgI3XefogHn/2kV7uP'+
  '2QIDAQAB'

// 加密
export function encrypt(txt) {
  const encryptor = new JSEncrypt()
  encryptor.setPublicKey(publicKey) // 设置公钥
  return encryptor.encrypt(txt) // 对数据进行加密
}
