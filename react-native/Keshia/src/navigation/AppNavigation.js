import React, { Component } from 'react';
import { createAppContainer } from 'react-navigation';
import { createStackNavigator } from 'react-navigation-stack';
import HomeView from '../screen/HomeView';
import employeeView from '../screen/employeeView';
import queryPunchClock from '../screen/queryPunchClock';
import createDayOff from '../screen/createDayOff';

const MainStack = createStackNavigator({
    HomeScreen: {
      screen: HomeView,
      navigationOptions: {
        header: null
      }
    },
  employeeScreen: {
    screen: employeeView,
    navigationOptions: {
      header: null
    }
  },
  queryPunchClockScreen: {
    screen: queryPunchClock,
    navigationOptions: {
      header: null
    }
  },
  createDayOffScreen: {
    screen: createDayOff,
    navigationOptions: {
      header: null
    }
  }
  
});

const AppStackNavigator = createStackNavigator(
  {
    MainScreen: {
      screen: MainStack,
    },
  },
  {
    mode: 'modal',
    headerMode: 'none',
    transparentCard: true,
  }
);

export default createAppContainer(AppStackNavigator);