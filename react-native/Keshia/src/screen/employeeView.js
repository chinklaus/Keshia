/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */
import React from 'react';
import axios from 'axios';
import {
  SafeAreaView,
  StyleSheet,
  Image,
  View,
  Text,
  TextInput,
  TouchableOpacity
} from 'react-native';
import LinearGradient from 'react-native-linear-gradient';
import { userRequest, userRequestType } from '@services/api';

class employeeView extends React.Component {
  constructor(props, context) {
    super(props, context);
    this.state = {
      queryUserData: '',
      loading: false,
    };
  } 

  getEmployee() {
    this.setState({
      loading: true,
    });
    console.log('getEmployee ')
    axios.post('http://10.107.14.6:8180/bi/phonebook/queryUser', {
      keyWord: "119831"
    }).then(res => {
      console.log("TCL: HomeView -> getRequestTyoe -> res", res);
      this.setState({
        queryUserData: res.data
      })
    }).catch(error => {
      this.setState({
        loading: false,
        isRefresh: false,
      });
      if (!error.code && error.message === 'Network Error') {
        this.setState({
          errorType: 'NetworkError',
        });
      } else {
        this.setState({
          errorType: 'timeout',
        });
      }
    });
  }


  render() {
    return (
      <LinearGradient colors={['#4c669f', '#3b5998', '#999']} style={{ flex: 1, }}>
        <View style={styles.mainView}>
          <View style={styles.sectionTextView}>
            <Text style={styles.sectionTitle}>Staff</Text>
          </View>
        </View>
      </LinearGradient>
    );
  }
};

const styles = StyleSheet.create({
  mainView: {
    flex: 1,
    justifyContent: 'space-around',
  },
  sectionTextView: {
    justifyContent: 'center'
  },
  sectionTitle: {
    fontSize: 40,
    fontWeight: '600',
    color: "#fff",
    textAlign: 'center',
  },
  sectionSubTitle: {
    fontSize: 24,
    fontWeight: '600',
    color: "#fff",
    textAlign: 'center',
  },
  micButton: {
    width: 100,
    height: 100,
    justifyContent: 'center',
    alignItems: 'center',
    alignSelf: 'center',
    borderRadius: 50,
    backgroundColor: '#fff'
  },
});

export default employeeView;
