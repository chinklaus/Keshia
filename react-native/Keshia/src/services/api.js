import axios from 'axios';

export const serverUrl = 'http://10.107.14.6:8180/';
export const searchTypeUrl = 'http://10.107.83.17:9200/';
export const imageUrl = 'https://cdn.wpgdadatong.com';
export const sharePostUrl = 'https://www.wpgdadatong.com';

export const iosVersionNumber = '1.7.2';
export const androidVersionNumber = '1.7.3';

const userRequestType = axios.create({
  baseURL: searchTypeUrl + '_search',
  timeout: 60000
});

const userRequest = axios.create({
  baseURL: serverUrl + '/bi',
  timeout: 60000
});

export { userRequest, userRequestType };

