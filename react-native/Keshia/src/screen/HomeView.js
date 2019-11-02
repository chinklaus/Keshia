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
class HomeView extends React.Component {
  constructor(props, context) {
    super(props, context);
    this.state = {
     userRequestText:'',
     requestType:'',
     loading: false,
    };
  }

  getRequestType() {
      this.setState({       
          loading: true,
      });
    console.log('getRequestType onSubmitEditing')  
    axios.post('http://10.107.83.17:9200/_search', {
        min_score: 1,
        query: {
          match: {
            ITEM_CONTENT: this.state.userRequestText
          }
        }
      }).then(res => {
        console.log("TCL: HomeView -> getRequestType -> res", res);
          this.setState({
            requestType: res.data.hits.hits[0]._source.ITEM_URL
          })
        let requestType = res.data.hits.hits[0]._source.ITEM_URL

        if (requestType == 'queryUser') {
          return (
            this.props.navigation.navigate('employeeScreen')
            // userRequest.post('/phonebook/queryUser', {
            //   keyWord: this.state.userRequestText
            // }).then(res => {
            //   console.log("TCL: HomeView -> getRequestTyoe -> res", res)
            // })
          )
        } else if (requestType == 'queryPunchClock'){
          return (
            this.props.navigation.navigate('queryPunchClockScreen')
          )
        }
        else if (requestType == 'createDayOffDetail'){
          this.props.navigation.navigate('createDayOffScreen')
        }
          
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
          <Text style={styles.sectionTitle}>Keshia</Text>
          <Text style={styles.sectionSubTitle}>Your Assistant,</Text>
        </View>
        <TextInput
          style={{
            width: '80%',
            height: 40,
            color: '#fff',
            marginLeft: 'auto',
            marginRight: 'auto',
            borderColor: 'gray',
            borderBottomWidth: 1
          }}
          placeholder={'想做什麼呢'}
          placeholderTextColor="#999"
          value={this.state.userRequestText}
          autoCorrect={false}
          autoCapitalize="none"
          returnKeyType="next"
          onChangeText={text =>
            this.setState({ userRequestText: text })
          }
          onSubmitEditing={() => this.getRequestType() }
        />
        <TouchableOpacity style={styles.micButton}>
          <Image
            style={{ width: 50, height: 50 }}
            source={require('../assets/icons8-microphone-60.png')}
          />
        </TouchableOpacity>
        
        </View>
    </LinearGradient>
  );
  }
};

const styles = StyleSheet.create({
  mainView: {
    flex:1,
    justifyContent:'space-around',
  },
  sectionTextView:{
    justifyContent:'center'
  },
  sectionTitle: {
    fontSize: 40,
    fontWeight: '600',
    color: "#fff",
    textAlign: 'center',
  },
  sectionSubTitle:{
    fontSize: 24,
    fontWeight: '600',
    color: "#fff",
    textAlign: 'center',
  },
  micButton:{
    width: 100,
    height: 100,
    justifyContent:'center',
    alignItems: 'center',
    alignSelf: 'center',
    borderRadius: 50,
    backgroundColor:'#fff'
  },
});

export default HomeView;
