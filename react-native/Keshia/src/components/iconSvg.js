import React, { Component } from 'react';
import { StyleSheet, View, } from 'react-native';
import Svg, { Path, Circle, Rect } from 'react-native-svg';

export const MicSvg = (props) => {
    return <View style={styles.iconView}>
        <Svg viewBox="0 0 512 512"
            width={24}
            height={24}
            fill={props.fill}
            stroke={props.stroke}
            strokeWidth={props.strokeWidth}
            {...props}>
            <Path d="M12 1a3 3 0 00-3 3v8a3 3 0 006 0V4a3 3 0 00-3-3z" />
            <Path d="M19 10v2a7 7 0 01-14 0v-2M12 19v4M8 23h8" />
        </Svg>
    </View>;
};

const styles = StyleSheet.create({
    iconView: {
        alignItems: 'center',
        justifyContent: 'center',
    }
});

