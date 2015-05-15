%% *************************************************************
% Occupational Biomechanics
% Homework #1
%
% author: Kilho Kim, Hakeun Jin
% Information Management Lab
% Industrial Engineering, Seoul National University
% **************************************************************

1. MBPP 프로그램 전체 구성
a) 메모리 및 posture 저장소 관련 함수
 - CELL_CONSTRUCTION : 빈 CELL(메모리) 생성
 - RANDOM_POSTURE : 하나의 posture 랜덤 생성
 - MEMORY_CONSTRUCTION : 랜덤 생성한 posture를 CELL에 저장
b) 신체 부위 별 길이 및  위치좌표 계산 관련 함수
 - COM_LOCATION : center of mass 위치 좌표 계산
 - HAND_LOCATION : 손의 위치 좌표 계산 
 - SHOULDER_LOCATION : 어깨의 위치 좌표 계산 
 - LINK : (신장에 비례하여) 신체 부위 별 길이 계산
 - THICKNESS : (성별 및 연령대에 따른) 신체 부위 별 반지름 계산 
 - LOCATE_VOL : (신체 부피를 고려할 때의) 신체 상의 센서 위치 좌표 계산
 - LOCATE_WOVOL : (신체 부피를 고려하지 않을 때의) 신체 상의 센서 위치 좌표 계산
c) Potential 및 REBA 점수 계산 관련 함수
 - POTENTIAL2 : 신체 센서의 장애물에 대한 potential 계산 
 - REBA : 주어진 posture에 대한 REBA 점수 계산 
d) 시각화 관련 함수
 - BPLOT : 직사각형 장애물 plot
 - CPLOT : 원형 장애물 plot
 - TPLOT : 목표물 plot
 - VISUALIZE : 신체 상의 센서 plot
e) PROGRAM : 메인 프로그램

2. MBPP 프로그램 사용법
a) PROGRAM 함수를 실행
b) 신체의 신장(stature)을 cm 단위로 입력
c) 입력한 신장에 대한 CELL이 사전에 생성되어 있지 않은 경우, 
 - 현재 폴더를 기준으로 ./CELL 폴더를 자동으로 생성
 - ./CELL 폴더 내에, 손이 위치하는 x,y 좌표 별 CELL 파일 자동 생성
 - posture 랜덤 생성 횟수(number of trials) 및 threshold 입력
 - 입력한 설정에 따라 랜덤한 posture를 생성하여 CELL에 저장
d) 과업 유형 선택 (반도체 공장, 계단, 자동차 공장 중 택일)
e) 성별 선택 (남성, 여성)
f) 나이 입력
g) 목표물의 x,y좌표 입력
h) 목표물의 질량(kg) 입력
i) 신체 부피를 고려할지 여부 선택 (고려, 고려하지 않음)
j) potential이 0인 전체 posture plot 및 REBA 점수가 최소인 자세 plot 확인