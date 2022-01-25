drop database shop;
create schema shop;
use shop;

create table pro_order(
	order_no integer primary key auto_increment,
    id varchar(20) not null,
    email varchar(100) not null,
    pro_no Integer,
    pro_price Integer,
    pro_count Integer,
    order_name varchar(20) not null,
    order_phone varchar(20),
    order_email varchar(20) not null,
    reci_name varchar(20) not null,
    reci_phone varchar(20) not null,
    home_phone varchar(20) not null,
    addrnum varchar(20) not null,	
    addr varchar(20) not null,
    detailaddr varchar(20) not null,
    msg varchar(20) not null,
    order_date datetime not null DEFAULT CURRENT_TIMESTAMP,
    delivery Integer  not null
);
select * from pro_order;


create table tbl_buy(
	buy_no Integer primary key auto_increment,
    cart_no varchar(20),
    id varchar(20) not null,
    cart_count Integer not null,
    pro_no Integer not null

);
select * from tbl_buy;





create table cart(
	cart_no Integer primary key auto_increment,
    id varchar(100) not null,
    cart_count Integer not null,#구입한 물건개수
    pro_no Integer not null,
    imgfile varchar(200)
);

select * from cart;




create table product(
pro_no integer primary key auto_increment,
category varchar(20),
title varchar(200) not null,
imgfile varchar(200),
piece varchar(20) not null,
weight integer not null,
beforePrice integer not null,
Discount  integer not null,
price integer not null default 0,  
storage varchar(200) not null,
SalesVolume integer not null,
inventory integer not null default 100
);


select * from product;




create table member(
id varchar(40) primary key,
email varchar(100),
pwd varchar(20) not null,
name varchar(20) not null,
phone varchar(20) not null,
address varchar(20),
mileage integer not null default 100000,
coupon integer not null default 2,
reserve integer not null default 5000,
gender varchar(20) not null,
regd8 datetime not null DEFAULT CURRENT_TIMESTAMP,
eregd8 datetime not null DEFAULT CURRENT_TIMESTAMP
);
use shop;

insert into member(id,email,pwd,name,phone,gender) values("admin","admin@greenMall.com", "1234", "관리자","010-0000-0000","남성");

select * from member;


create table address(
addr_no Integer primary key auto_increment,
id varchar(100) not null,
foreign key (id)
references member(id) ON DELETE CASCADE,
addrname varchar(20) not null,
name varchar(20) not null,
addrNum varchar(20) not null,
addr varchar(20) not null,
detailAddr varchar(20) not null,
phone varchar(20) not null,
hphone varchar(20),
addrd8 datetime not null DEFAULT CURRENT_TIMESTAMP
);



select * from address;





create table notice(
	n_no integer primary key auto_increment,
    division varchar(20) not null,
    title varchar(50) not null,
    content varchar(5000) not null,
    regd8 datetime not null DEFAULT CURRENT_TIMESTAMP,
    notice_file varchar(500),
    readcount Integer not null default 0
);

use shop;


select * from notice;


insert into notice(division, title, content, notice_file) values("일반", "1번제목", "1번컨텐츠","1번파일");
insert into notice(division, title, content, notice_file) values("일반", "2번제목", "2번컨텐츠","2번파일");
insert into notice(division, title, content, notice_file) values("일반", "3번제목", "3번컨텐츠","3번파일");
insert into notice(division, title, content, notice_file) values("일반", "4번제목", "4번컨텐츠","4번파일");
insert into notice(division, title, content, notice_file) values("일반", "5번제목", "5번컨텐츠","5번파일");
insert into notice(division, title, content, notice_file) values("일반", "6번제목", "6번컨텐츠","6번파일");
insert into notice(division, title, content, notice_file) values("일반", "7번제목", "7번컨텐츠","7번파일");
insert into notice(division, title, content, notice_file) values("일반", "8번제목", "8번컨텐츠","8번파일");
insert into notice(division, title, content, notice_file) values("일반", "9번제목", "9번컨텐츠","9번파일");
insert into notice(division, title, content, notice_file) values("일반", "10번제목", "10번컨텐츠","10번파일");
insert into notice(division, title, content, notice_file) values("일반", "11번제목", "11번컨텐츠","11번파일");
insert into notice(division, title, content, notice_file) values("일반", "12번제목", "12번컨텐츠","12번파일");
insert into notice(division, title, content, notice_file) values("일반", "13번제목", "13번컨텐츠","13번파일");
insert into notice(division, title, content, notice_file) values("일반", "14번제목", "14번컨텐츠","14번파일");
insert into notice(division, title, content, notice_file) values("일반", "15번제목", "15번컨텐츠","15번파일");


#########################################################
#상품
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("닭가슴살","소스가 맛있는 닭가슴살 4종 16팩,각 4팩씩","thumnail3.jpg","16",120,50000,30,0,"냉동보관 -18℃이하",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("닭가슴살","소맛닭X하프라이스 든든 한끼","thumnail2.jpg","7",120,50000,50,0,"냉동보관 -18℃이하",0);

insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("닭가슴살","소맛닭 4종 4팩 체험팩","thumnail1.jpg","4",120,9800,29,0,"냉동보관 -18℃이하",0);	

insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("닭가슴살","소스가 맛있는 닭가슴살 슬라이스 레드크림커리 1팩","thumnail4.jpg","1",120,2450,5,0,"냉동보관 -18℃이하
",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("닭가슴살","소스가 맛있는 닭가슴살 슬라이스 스파이시커리 1팩","thumnail5.jpg","1",120,2450,5,0,"냉동보관 -18℃이하
",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("닭가슴살","소스가 맛있는 닭가슴살 슬라이스 화이트머쉬룸 1팩","thumnail6.jpg","1",120,2450,5,0,"냉동보관 -18℃이하
",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("닭가슴살","소스가 맛있는 닭가슴살-데미갈릭페퍼 1팩","thumnail7.jpg","1",120,2450,5,0,"냉동보관 -18℃이하
",0);	

 
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("도시락","UNDER299 도시락 체험팩 7종 7팩","thumnail10.jpg","7",200,34300,30,0,"냉동보관 -18℃이하
",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("도시락","UNDER299 도시락 체험팩 7종 10팩","thumnail9.jpg","10",200,49000,30,0,"냉동보관 -18℃이하
",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("도시락","UNDER 299 도시락 7종 7팩(+도시락 1팩 랜덤 추가증정)","thumnail8.jpg","7",200,34300,14,0,"냉동보관 -18℃이하
",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("도시락","하루 두끼 599kcal미만 1일 2식 (9종 12팩)","thumnail18.jpg","12",200,48000,25,0,"냉동보관 -18℃이하
",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("도시락","UNDER299 도시락-단호박영양밥&청양비엔나 1팩","thumnail11.jpg","1",170,4900,5,0,"냉동보관 -18℃이하
",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("도시락","UNDER299 도시락-연근영양밥&골드오믈렛 1팩","thumnail12.jpg","1",170,4900,5,0,"냉동보관 -18℃이하
",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("도시락","UNDER299 도시락-연근영양밥&훈제오리지널 1팩","thumnail13.jpg","1",180,4900,5,0,"냉동보관 -18℃이하
",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("도시락","UNDER299 도시락-퀴노아영양밥&깻잎볼 1팩","thumnail14.jpg","1",180,4900,5,0,"냉동보관 -18℃이하
",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("도시락","UNDER299 도시락-퀴노아영양밥&치킨채소롤 1팩","thumnail15.jpg","1",170,4900,5,0,"냉동보관 -18℃이하
",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("도시락","UNDER299 도시락-현미야채밥&갈릭비엔나 1팩","thumnail16.jpg","1",170,4900,5,0,"냉동보관 -18℃이하
",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("도시락","UNDER299 도시락-현미야채밥&소맛닭레드커리 1팩","thumnail17.jpg","1",190,4900,5,0,"냉동보관 -18℃이하
",0);	

insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("만두","[체험팩]메밀전병X만두3종","thumnail19.jpg","4",180,23200,29,0,"냉동보관 -18℃이하",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("만두","닭가슴살 만두 3종 15팩","thumnail23.jpg","15",180,36000,28,0,"냉동보관 -18℃이하",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("만두","만두&치밥 6종 18팩 세트","thumnail25.jpg","18",180,48000,17,0,"냉동보관 -18℃이하",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("만두","굽네 닭가슴살 김치만두 180g 1팩","thumnail20.jpg","1",180,2400,5,0,"냉동보관 -18℃이하",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("만두","닭가슴살 갈비맛만두 1팩","thumnail21.jpg","1",180,2400,5,0,"냉동보관 -18℃이하",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("만두","닭가슴살 만두 1팩","thumnail22.jpg","1",180,2400,5,0,"냉동보관 -18℃이하",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("만두","닭가슴살 메밀전병 1팩","thumnail24.jpg","1",390,4400,5,0,"냉동보관 -18℃이하",0);	



insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("소시지","육즙가득 맛있는 소시지 세트 9팩","thumnail27.jpg","9",70,20300,17,0,"냉동보관 -18℃이하",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("소시지","그릴후랑크 마늘 1팩","thumnail26.jpg","1",120,2400,5,0,"냉동보관 -18℃이하",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("소시지","탱글 치킨 후랑크 1팩","thumnail28.jpg","1",150,2500,5,0,"냉동보관 -18℃이하",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("소시지","후랑크 블랙페퍼 1팩","thumnail29.jpg","1",120,2400,5,0,"냉동보관 -18℃이하",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("소시지","후랑크 양꼬치맛 1팩","thumnail30.jpg","1",120,2400,5,0,"냉동보관 -18℃이하",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("소시지","후랑크 청양고추 1팩","thumnail31.jpg","1",120,2400,5,0,"냉동보관 -18℃이하",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("소시지","후랑크 할라피노 1팩","thumnail32.jpg","1",120,2400,5,0,"냉동보관 -18℃이하",0);	


insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("치밥","치밥 6종 12팩","thumnail33.jpg","12",200,33600,20,0,"냉동보관 -18℃이하",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("치밥","치밥 베스트 3종 7팩","thumnail34.jpg","7",200,19600,16,0,"냉동보관 -18℃이하",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("치밥","만두&치밥 6종 18팩 세트","thumnail37.jpg","18",200,48000,17,0,"냉동보관 -18℃이하",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("치밥","통닭다리살&안주 치팅세트","thumnail39.jpg","11",200,41700,20,0,"냉동보관 -18℃이하",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("치밥","갈비천왕 치밥 1팩","thumnail35.jpg","1",200,2800,5,0,"냉동보관 -18℃이하",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("치밥","닭가슴살 깍두기 치밥 1팩","thumnail36.jpg","1",200,2800,5,0,"냉동보관 -18℃이하",0);	
insert into product(category,title,imgfile,piece,weight,beforePrice,Discount,price,storage,SalesVolume)
VALUES ("치밥","볼케이노 치밥 1팩","thumnail38.jpg","1",200,2800,5,0,"냉동보관 -18℃이하",0);	


############################################################################
#게시판

insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]6월 친구들 다 소환행 이벤트", "<6월 친구들 다 소환행 이벤트 - CGV 티켓 당첨자 발표>



★당첨을 축하드립니다★



 - 경품 : CGV영화상품권/2매

 - 유효기간 : 2019/10/31","2019-07-08 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]마라볼케이노 치킨상품권 이벤트", "[당첨자발표]마라볼케이노 치킨상품권 이벤트

45,000원 이상 결제 회원님 대상 매일 10명 추첨! 

마라볼케이노 치킨 상품권은 8/5일 일괄 지급해드릴 예정입니다!

8월 5일 당첨안내 개별 문자도 같이 드릴께요~^^ 축하드려요 ♥





♠7월 31일 당첨자

cjs070*,  475*

miremi110*,  815*

kyb13*,  006*

sarbiaon*,  625*

kem102*,  467*

osm110*,  601*

shstnf31*,  638*

hohohosek*,  345*

mykdw052*,  467*

dj61*,  514*

감사합니다. ","2019-07-08 17:30:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "skycoya  (5901)



misscherry0707 (6025)





당첨을 축하드립니다!







당첨되신 고객님께는 발표 당일에 '프로급 식단 추천★베스트 닭가슴살 모아세트' 무료결제 쿠폰번호를







SMS로 보내드립니다.







혹시 개별 연락을 받지 못하셨을 경우에는, 1:1게시판에 내용 남겨주시면 조속히 확인하겠습니다.

","2019-07-08 17:35:21");
insert into notice(division, title, content, regd8) values("시스템", "[서비스 일시 중단 안내]", "서비스 일시중단 안내
신규 서버 이관작업으로","2019-07-10 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "dwd12** (1667)



coyam** (6088)





당첨을 축하드립니다!



당첨되신 고객님께는 발표 당일에 '프로급 식단 추천★베스트 닭가슴살 모아세트' 무료결제 쿠폰번호를



SMS로 보내드립니다.



혹시 개별 연락을 받지 못하셨을 경우에는, 1:1게시판에 내용 남겨주시면 조속히 확인하겠습니다.","2019-07-15 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2019-07-22 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2019-07-29 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2019-08-01 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2019-08-05 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2019-08-06 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2019-08-12 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2019-08-16 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2019-08-19 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2019-08-12 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2019-07-22 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2019-07-29 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2019-08-01 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2019-08-02 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2019-08-03 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2019-08-04 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2019-08-05 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2019-08-06 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2019-08-07 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2019-08-08 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2019-08-09 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2019-08-10 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2019-08-11 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2019-08-12 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2019-08-13 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2019-08-14 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2019-08-15 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2019-08-16 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2019-08-17 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2019-08-18 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2019-08-19 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2019-08-20 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2019-08-21 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2019-08-22 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2019-08-23 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2019-08-24 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2019-08-25 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2019-08-26 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2019-08-27 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2019-08-28 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2019-08-29 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2019-08-30 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2019-09-01 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2019-09-02 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2019-09-03 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2019-09-04 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2019-09-05 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2019-09-06 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2019-09-07 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2019-09-08 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2019-09-09 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2019-09-10 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2019-09-11 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2019-09-12 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2019-09-13 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2019-09-14 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2019-09-15 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2019-09-16 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2019-09-17 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2019-09-18 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2019-09-19 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2019-09-20 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2019-09-21 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2019-09-22 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2019-09-23 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2019-09-24 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2019-09-25 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2019-09-26 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2019-09-27 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2019-09-28 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2019-09-30 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2019-10-01 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2019-10-02 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2019-10-03 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2019-10-04 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2019-10-05 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2019-10-06 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2019-10-07 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2019-10-08 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2019-10-09 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2019-10-10 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2019-10-11 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2019-10-12 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2019-10-13 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2019-10-14 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2019-10-15 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2019-10-16 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2019-10-17 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2019-10-18 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2019-10-19 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2019-10-20 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2019-10-21 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2019-10-22 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2019-10-23 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2019-10-24 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2019-10-25 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2019-10-26 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2019-10-27 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2019-10-28 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2019-10-29 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2019-10-30 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2019-11-01 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2019-11-02 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2019-11-03 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2019-11-04 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2019-11-05 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2019-11-06 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2019-11-07 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2019-11-08 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2019-11-09 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2019-11-10 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2019-11-11 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2019-11-12 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2019-11-13 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2019-11-14 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2019-11-15 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2019-11-16 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2019-11-17 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2019-11-18 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2019-11-19 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2019-10-20 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2019-11-21 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2019-11-22 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2019-11-23 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2019-11-24 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2019-11-25 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2019-11-26 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2019-11-27 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2019-11-28 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2019-11-29 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2019-11-30 17:22:21");

insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2020-07-22 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2020-07-29 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2020-08-01 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2020-08-05 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2020-08-06 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2020-08-12 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2020-08-16 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2020-08-19 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2020-08-12 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2020-07-22 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2020-07-29 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2020-08-01 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2020-08-02 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2020-08-03 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2020-08-04 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2020-08-05 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2020-08-06 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2020-08-07 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2020-08-08 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2020-08-09 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2020-08-10 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2020-08-11 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2020-08-12 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2020-08-13 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2020-08-14 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2020-08-15 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2020-08-16 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2020-08-17 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2020-08-18 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2020-08-19 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2020-08-20 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2020-08-21 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2020-08-22 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2020-08-23 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2020-08-24 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2020-08-25 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2020-08-26 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2020-08-27 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2020-08-28 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2020-08-29 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2020-08-30 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2020-09-01 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2020-09-02 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2020-09-03 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2020-09-04 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2020-09-05 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2020-09-06 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2020-09-07 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2020-09-08 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2020-09-09 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2020-09-10 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2020-09-11 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2020-09-12 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2020-09-13 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2020-09-14 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2020-09-15 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2020-09-16 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2020-09-17 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2020-09-18 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2020-09-19 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2020-09-20 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2020-09-21 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2020-09-22 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2020-09-23 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2020-09-24 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2020-09-25 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2020-09-26 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2020-09-27 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2020-09-28 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2020-09-30 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2020-10-01 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2020-10-02 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2020-10-03 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2020-10-04 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2020-10-05 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2020-10-06 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2020-10-07 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2020-10-08 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2020-10-09 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2020-10-10 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2020-10-11 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2020-10-12 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2020-10-13 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2020-10-14 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2020-10-15 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2020-10-16 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2020-10-17 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2020-10-18 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2020-10-19 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2020-10-20 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2020-10-21 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2020-10-22 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2020-10-23 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2020-10-24 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2020-10-25 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2020-10-26 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2020-10-27 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2020-10-28 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2020-10-29 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2020-10-30 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2020-11-01 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2020-11-02 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2020-11-03 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2020-11-04 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2020-11-05 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2020-11-06 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2020-11-07 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2020-11-08 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2020-11-09 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2020-11-10 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2020-11-11 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2020-11-12 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2020-11-13 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2020-11-14 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2020-11-15 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2020-11-16 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2020-11-17 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2020-11-18 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2020-11-19 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 추석명절 배송 공지", "12번컨텐츠","2020-10-20 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2020-11-21 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2020-11-22 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 2주차 끝판왕포토후기 당첨자(2명) 발표-", "13번컨텐츠","2020-11-23 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2020년 12월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2020-11-24 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 3주차 끝판왕포토후기 당첨자(2명) 발표-", "6번컨텐츠","2020-11-25 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "-7월 4주차 끝판왕포토후기 당첨자(2명) 발표-", "7번컨텐츠","2020-11-26 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2019년 8월 신용카드 무이자 할부 행사 안내", "8번컨텐츠","2020-11-27 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "-8월 1주차 끝판왕포토후기 당첨자(2명) 발표-", "9번컨텐츠","2020-11-28 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "8.15 광복절 연휴 배송 공지", "10번컨텐츠","2020-11-29 17:22:21");
insert into notice(division, title, content, regd8) values("이벤트", "[당첨자발표]7월 친구들 다 소환행 이벤트", "11번컨텐츠","2020-11-30 17:22:21");


insert into notice(division, title, content, regd8) values("일반", "2021년 회원등급 기준 및 무료배송 금액 변경 안내", "15번컨텐츠","2020-12-01 17:22:21");
insert into notice(division, title, content, regd8) values("시스템", "스마일 페이 간편결제 - 전산시스템 점검 안내 12월", "1번컨텐츠","2021-12-02 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "크롬 결제시, 오류 관련 하여 안내드립니다.", "2번컨텐츠","2021-08-02 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "앱 결제시, 신용카드 세션만료 오류 관련 하여 안내드립니다.", "3번컨텐츠","2021-08-03 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "성탄절 및 신정 연휴 배송 일정안내", "4번컨텐츠","2021-08-04 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2021년 1월 신용카드 무이자 할부 행사 안내", "5번컨텐츠","2021-08-05 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "21년 설 연휴 배송일정 안내 드립니다.", "6번컨텐츠","2021-08-06 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "	2021년 2월 신용카드 무이자 할부 행사 안내", "7번컨텐츠","2021-08-07 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "21년 삼일절 연휴 배송일정 안내 드립니다.", "8번컨텐츠","2021-08-08 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2021년 3월 신용카드 무이자 할부 행사 안내", "9번컨텐츠","2021-08-09 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "시식후기 적립금 조정에 대하여 안내 드립니다.", "10번컨텐츠","2021-08-10 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "적립금 유효기간 변경 안내(시행일 : 2021년 4월 15일)", "11번컨텐츠","2021-08-11 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2021년 4월 신용카드 무이자 할부 행사 안내", "12번컨텐츠","2021-08-12 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "	어린이날 연휴 배송일정 안내 드립니다.", "13번컨텐츠","2021-08-13 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2021년 5월 신용카드 무이자 할부 행사 안내", "14번컨텐츠","2021-08-14 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "석가탄신일 연휴 배송일정 안내 드립니다.", "15번컨텐츠","2021-08-15 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2021년 6월 신용카드 무이자 할부 행사 안내", "1번컨텐츠","2021-08-28 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2021년 7월 신용카드 무이자 할부 행사 안내", "2번컨텐츠","2021-08-28 17:22:21");
insert into notice(division, title, content, regd8) values("시스템", "	[스마일페이] 결제서비스 정기점검 안내", "3번컨텐츠","2017-08-28 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2021년 8월 신용카드 무이자 할부 행사 안내", "4번컨텐츠","2017-08-28 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "광복절 대체휴무일로 인한 택배배송 안내 건", "5번컨텐츠","2017-08-28 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "	회원등급 기준금액 변경 안내(시행일 : 2021년 9월 1일)", "안녕하세요. 고객님. 
굽네몰입니다.

먼저 굽네몰을 이용해주시는 고객님께 감사의 말씀 드립니다. 

힘든 시기, 
고객님들께
보다 나은 쇼핑 혜택 제공을 위해
회원 승급을 위한 기준금액이 기존보다 대폭 하향됩니다. 


■ 변경 내용 : 굽네몰 일부 회원등급(실버,골드,VIP) 승급기준 금액 조정 건

■ 운영방침 변경 시행일 : 2021년 9월 01일(수)

■ 주요 변경 내용
◎패밀리 등급 : 변동 없음

◎실버 등급 : 패밀리 → 실버 승급을 위한 기준금액 하향 (변경 전 15만원→변경 후 10만원)

◎골드 등급 : 실버 → 골드 승급을 위한 기준금액 하향 (변경 전 30만원→변경 후 15만원)

◎VIP 등급:  골드 → VIP 승급을 위한 기준금액 하향 (변경 전 50만원→변경 후 25만원)



적립율은 변경이 없으며, 승급을 위한 기준금액만 하향되므로 

 기존보다 훨씬 많은 고객님들께서  9월에 승급혜택을 받으실 것으로 예상됩니다. 

 9월 초 승급 고객님들께는 별도의 개별 공지를 드릴 예정이오니, 
 승급된 혜택을 확인하시어 주문 시 많은 이용 부탁드립니다.  
 

 감사합니다. 
","2021-08-31 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "추석 연휴 배송일정 안내드립니다. (15일 오후 2시 주문 건까지 마감)", "안녕하세요.

굽네몰입니다.



다가오는 21년 추석 연휴 배송일정 안내 드립니다. 

주문 시 하단의 내용을 꼭 참고 부탁드립니다.  

※ 택배사 사정으로 연휴 전 배송가능 주문일이 16일→15일로 변경되었습니다.
    또한 제주지역은 태풍으로 인해 11일부터 집화마감되어 기존 공지해드린 일자보다 일찍 주문이 마감되었습니다. 양해 부탁드립니다. 




※내륙지역  

2021년 9월 15일 14시 이전 주문 :  9월 15일 당일 출고하여 연휴 전 수령 가능

2021년 9월 15일 14시 이후 주문 :  연휴 직후 순차 출고되어 연휴 이후에 수령 



※제주 및 도서산간 지역 

2021년 9월 11일 14시 이전 주문 : 9월 11일 당일 출고하여 연휴 전 수령 가능 

2021년 9월 11일 14시 이전 주문 : 연휴 이후 순차 출고되어 연휴 이후에 수령 


풍성한 한가위 되시길 바랍니다.

감사합니다. ","2021-09-06 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "10월 대체휴일 관련 배송공지 드립니다.", "안녕하세요. 그린몰입니다. 



10월 대체휴일 관련하여 배송공지 드립니다. 

그린몰은 10월 4일(월)과 10월 11일(월) 대체휴일에도

주문하신 상품들을 순차출고할 예정입니다. 

※ 단, 10월 8일(금)과 9일(토)은 택배 쉬는 날로 인해 물류센터 미운영으로 출고가 어려우므로, 

    7일 오후 2시 이후 주문 건들은 11일에 순차출고될 예정입니다. 

※또한, 일부 배송지연 품목을 포함하여 주문하셨을 경우에는 

해당일에 정상출고가 어려울 수 있는 점 거듭 양해 부탁드립니다. 



최대한 배송 지연없이 대체 휴일 다음 날에

바로 받으실 수 있게끔 노력하겠습니다. 

그린몰을 이용해주셔서 감사합니다.  ","2021-09-30 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2021년 10월 신용카드 무이자 할부 행사 안내", "2021년 10월 신용카드 무이자 할부 행사 안내","2021-10-27 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2021년 11월 신용카드 무이자 할부 행사 안내", "2021년 11월 신용카드 무이자 할부 행사 안내","2021-11-01 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2021년 12월 신용카드 무이자 할부 행사 안내", "2021년 12월 신용카드 무이자 할부 행사 안내","2021-11-30 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "	크리스마스,신정 택배휴무일로 인한 배송 안내 건", "안녕하세요.  그린몰입니다.

그린몰을 사랑해주시고 찾아주셔서 감사드립니다.



12월 크리스마스, 신정 관련하여 배송일정 안내 드립니다. 

주문 시 하단의 내용을 꼭 참고 부탁드립니다.  

1. 크리스마스

※내륙지역  

2021년 12월 23일 14시 이전 주문 :  12월 23일 당일 출고하여 연휴 전 수령 가능

2021년 12월 23일 14시 이후 주문 :  연휴 직후 (12월 26일) 순차 출고되어 연휴 이후에 수령 

※제주 및 도서산간 지역 

2021년 12월 21일 14시 이전 주문 :  12월 21일 당일 출고하여 연휴 전 수령 가능

2021년 12월 21일 14시 이후 주문 :  연휴 직후 (12월 26일) 순차 출고되어 연휴 이후에 수령 



2. 신정

※내륙지역  

2021년 12월 30일 14시 이전 주문 :  12월 30일 당일 출고하여 연휴 전 수령 가능

2021년 12월 30일 14시 이후 주문 :  연휴 직후 (1월 2일) 순차 출고되어 연휴 이후에 수령 

※제주 및 도서산간 지역 

2021년 12월 28일 14시 이전 주문 :  12월 28일 당일 출고하여 연휴 전 수령 가능

2021년 12월 28일 14시 이후 주문 :  연휴 직후 (1월 2일) 순차 출고되어 연휴 이후에 수령 ","2021-12-20 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "택배 파업으로 인한 배송 지연 안내", "안녕하세요 그린몰입니다.

먼저, 착한 닭가슴살 그린몰을 사랑해주셔서 감사드립니다.



택배사 파업으로 인해 여러 지역의 배송이 불가하여 공지드립니다.

파업 이후 배송되며 주문 취소를 원하시는 경우 고객센터로 문의해주세요.

[고객센터 번호] 1688-9247



정상화되는대로 안내 드리도록 하겠습니다.

감사합니다.","2021-12-29 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "2022년 1월 신용카드 무이자 할부 행사 안내", "무이자 할부 안내","2022-01-03 17:22:21");
insert into notice(division, title, content, regd8) values("일반", "설날 택배휴무일로 인한 배송 안내 건", "안녕하세요.  그린몰입니다.

그린몰을 사랑해주시고 찾아주셔서 감사드립니다.



2022년 설날 택배휴무일 관련하여 배송일정 안내 드립니다. 

주문 시 하단의 내용을 꼭 참고 부탁드립니다.  


※내륙지역  

2022년 1월 26일(수) 14시 이전 주문 :  1월 26일 당일 출고하여 연휴 전 수령 가능

2022년 1월 26일(수) 14시 이후 주문 :  연휴 직후 2월 2일(수) 순차 출고되어 연휴 이후에 수령 

※제주 및 도서산간 지역 

2021년 1월 24일(월) 14시 이전 주문 :  1월 24일 당일 출고하여 연휴 전 수령 가능

2021년 1월 24일(월) 14시 이후 주문 :  연휴 직후 2월 2일(수) 순차 출고되어 연휴 이후에 수령 



감사합니다.","2022-01-20 17:22:21");
