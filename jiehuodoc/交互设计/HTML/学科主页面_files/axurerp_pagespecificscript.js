﻿
var PageName = '学科主页面';
var PageId = 'dac866db2b7743f38c1dcfb8d39125ea'
var PageUrl = '学科主页面.html'
document.title = '学科主页面';
var PageNotes = 
{
"pageName":"学科主页面",
"showNotesNames":"False"}
var $OnLoadVariable = '';

var $CSUM;

var hasQuery = false;
var query = window.location.hash.substring(1);
if (query.length > 0) hasQuery = true;
var vars = query.split("&");
for (var i = 0; i < vars.length; i++) {
    var pair = vars[i].split("=");
    if (pair[0].length > 0) eval("$" + pair[0] + " = decodeURIComponent(pair[1]);");
} 

if (hasQuery && $CSUM != 1) {
alert('Prototype Warning: The variable values were too long to pass to this page.\nIf you are using IE, using Firefox will support more data.');
}

function GetQuerystring() {
    return '#OnLoadVariable=' + encodeURIComponent($OnLoadVariable) + '&CSUM=1';
}

function PopulateVariables(value) {
    var d = new Date();
  value = value.replace(/\[\[OnLoadVariable\]\]/g, $OnLoadVariable);
  value = value.replace(/\[\[PageName\]\]/g, PageName);
  value = value.replace(/\[\[GenDay\]\]/g, '2');
  value = value.replace(/\[\[GenMonth\]\]/g, '3');
  value = value.replace(/\[\[GenMonthName\]\]/g, '三月');
  value = value.replace(/\[\[GenDayOfWeek\]\]/g, '星期五');
  value = value.replace(/\[\[GenYear\]\]/g, '2012');
  value = value.replace(/\[\[Day\]\]/g, d.getDate());
  value = value.replace(/\[\[Month\]\]/g, d.getMonth() + 1);
  value = value.replace(/\[\[MonthName\]\]/g, GetMonthString(d.getMonth()));
  value = value.replace(/\[\[DayOfWeek\]\]/g, GetDayString(d.getDay()));
  value = value.replace(/\[\[Year\]\]/g, d.getFullYear());
  return value;
}

function OnLoad(e) {

}

var u115 = document.getElementById('u115');
gv_vAlignTable['u115'] = 'top';
var u122 = document.getElementById('u122');
gv_vAlignTable['u122'] = 'top';
var u21 = document.getElementById('u21');
gv_vAlignTable['u21'] = 'top';
var u32 = document.getElementById('u32');
gv_vAlignTable['u32'] = 'top';
var u156 = document.getElementById('u156');
gv_vAlignTable['u156'] = 'top';
var u130 = document.getElementById('u130');

var u7 = document.getElementById('u7');
gv_vAlignTable['u7'] = 'center';
var u2 = document.getElementById('u2');

var u79 = document.getElementById('u79');

var u4 = document.getElementById('u4');
gv_vAlignTable['u4'] = 'top';
var u153 = document.getElementById('u153');
gv_vAlignTable['u153'] = 'top';
var u140 = document.getElementById('u140');

var u17 = document.getElementById('u17');
gv_vAlignTable['u17'] = 'center';
var u135 = document.getElementById('u135');
gv_vAlignTable['u135'] = 'top';
var u151 = document.getElementById('u151');

var u42 = document.getElementById('u42');
gv_vAlignTable['u42'] = 'top';
var u168 = document.getElementById('u168');

var u55 = document.getElementById('u55');
gv_vAlignTable['u55'] = 'center';
var u101 = document.getElementById('u101');
gv_vAlignTable['u101'] = 'top';
var u14 = document.getElementById('u14');
gv_vAlignTable['u14'] = 'top';
var u48 = document.getElementById('u48');

var u105 = document.getElementById('u105');

var u27 = document.getElementById('u27');
gv_vAlignTable['u27'] = 'center';
var u138 = document.getElementById('u138');

var u52 = document.getElementById('u52');
gv_vAlignTable['u52'] = 'top';
var u20 = document.getElementById('u20');
gv_vAlignTable['u20'] = 'top';
var u67 = document.getElementById('u67');
gv_vAlignTable['u67'] = 'top';
var u65 = document.getElementById('u65');

var u120 = document.getElementById('u120');
gv_vAlignTable['u120'] = 'top';
var u152 = document.getElementById('u152');
gv_vAlignTable['u152'] = 'center';
var u110 = document.getElementById('u110');
gv_vAlignTable['u110'] = 'center';
var u6 = document.getElementById('u6');

var u108 = document.getElementById('u108');

var u37 = document.getElementById('u37');
gv_vAlignTable['u37'] = 'top';
var u159 = document.getElementById('u159');

var u62 = document.getElementById('u62');

var u141 = document.getElementById('u141');
gv_vAlignTable['u141'] = 'top';
var u11 = document.getElementById('u11');

var u75 = document.getElementById('u75');

var u133 = document.getElementById('u133');

var u34 = document.getElementById('u34');
gv_vAlignTable['u34'] = 'top';
var u68 = document.getElementById('u68');

var u89 = document.getElementById('u89');
gv_vAlignTable['u89'] = 'center';
var u39 = document.getElementById('u39');
gv_vAlignTable['u39'] = 'top';
var u47 = document.getElementById('u47');
gv_vAlignTable['u47'] = 'top';
var u184 = document.getElementById('u184');
gv_vAlignTable['u184'] = 'top';
var u72 = document.getElementById('u72');
gv_vAlignTable['u72'] = 'top';
var u103 = document.getElementById('u103');
gv_vAlignTable['u103'] = 'center';
var u164 = document.getElementById('u164');
gv_vAlignTable['u164'] = 'top';
var u99 = document.getElementById('u99');
gv_vAlignTable['u99'] = 'top';
var u66 = document.getElementById('u66');
gv_vAlignTable['u66'] = 'center';
var u112 = document.getElementById('u112');

var u44 = document.getElementById('u44');
gv_vAlignTable['u44'] = 'top';
var u78 = document.getElementById('u78');
gv_vAlignTable['u78'] = 'top';
var u179 = document.getElementById('u179');
gv_vAlignTable['u179'] = 'center';
var u57 = document.getElementById('u57');
gv_vAlignTable['u57'] = 'center';
var u119 = document.getElementById('u119');

var u16 = document.getElementById('u16');

var u125 = document.getElementById('u125');
gv_vAlignTable['u125'] = 'top';
var u41 = document.getElementById('u41');
gv_vAlignTable['u41'] = 'center';
var u172 = document.getElementById('u172');
gv_vAlignTable['u172'] = 'center';
var u149 = document.getElementById('u149');
gv_vAlignTable['u149'] = 'center';
var u54 = document.getElementById('u54');

var u118 = document.getElementById('u118');

var u88 = document.getElementById('u88');

var u38 = document.getElementById('u38');

var u176 = document.getElementById('u176');
gv_vAlignTable['u176'] = 'center';
var u26 = document.getElementById('u26');

var u174 = document.getElementById('u174');
gv_vAlignTable['u174'] = 'center';
var u128 = document.getElementById('u128');
gv_vAlignTable['u128'] = 'center';
var u85 = document.getElementById('u85');

var u51 = document.getElementById('u51');
gv_vAlignTable['u51'] = 'center';
var u182 = document.getElementById('u182');

var u10 = document.getElementById('u10');
gv_vAlignTable['u10'] = 'top';
var u100 = document.getElementById('u100');
gv_vAlignTable['u100'] = 'top';
var u23 = document.getElementById('u23');
gv_vAlignTable['u23'] = 'top';
var u144 = document.getElementById('u144');

var u166 = document.getElementById('u166');
gv_vAlignTable['u166'] = 'center';
var u82 = document.getElementById('u82');

var u36 = document.getElementById('u36');
gv_vAlignTable['u36'] = 'center';
var u30 = document.getElementById('u30');

var u95 = document.getElementById('u95');
gv_vAlignTable['u95'] = 'top';
var u61 = document.getElementById('u61');
gv_vAlignTable['u61'] = 'center';
var u116 = document.getElementById('u116');
gv_vAlignTable['u116'] = 'top';
var u158 = document.getElementById('u158');
gv_vAlignTable['u158'] = 'top';
var u74 = document.getElementById('u74');

var u123 = document.getElementById('u123');

var u114 = document.getElementById('u114');
gv_vAlignTable['u114'] = 'top';
var u33 = document.getElementById('u33');

var u160 = document.getElementById('u160');

var u157 = document.getElementById('u157');
gv_vAlignTable['u157'] = 'top';
var u92 = document.getElementById('u92');
gv_vAlignTable['u92'] = 'center';
var u46 = document.getElementById('u46');
gv_vAlignTable['u46'] = 'center';
var u126 = document.getElementById('u126');

var u71 = document.getElementById('u71');
gv_vAlignTable['u71'] = 'top';
var u181 = document.getElementById('u181');
gv_vAlignTable['u181'] = 'center';
var u5 = document.getElementById('u5');
gv_vAlignTable['u5'] = 'top';
var u98 = document.getElementById('u98');

var u127 = document.getElementById('u127');

var u43 = document.getElementById('u43');

var u169 = document.getElementById('u169');

var u56 = document.getElementById('u56');

var u150 = document.getElementById('u150');

var u142 = document.getElementById('u142');
gv_vAlignTable['u142'] = 'top';
var u106 = document.getElementById('u106');

var u154 = document.getElementById('u154');

var u40 = document.getElementById('u40');

var u139 = document.getElementById('u139');

var u87 = document.getElementById('u87');

var u53 = document.getElementById('u53');

var u104 = document.getElementById('u104');
gv_vAlignTable['u104'] = 'top';
var u121 = document.getElementById('u121');
gv_vAlignTable['u121'] = 'top';
var u19 = document.getElementById('u19');

var u155 = document.getElementById('u155');
gv_vAlignTable['u155'] = 'center';
var u109 = document.getElementById('u109');

var u84 = document.getElementById('u84');
gv_vAlignTable['u84'] = 'center';
var u50 = document.getElementById('u50');

var u97 = document.getElementById('u97');

var u63 = document.getElementById('u63');
gv_vAlignTable['u63'] = 'center';
var u170 = document.getElementById('u170');
gv_vAlignTable['u170'] = 'center';
var u76 = document.getElementById('u76');
gv_vAlignTable['u76'] = 'top';
var u134 = document.getElementById('u134');
gv_vAlignTable['u134'] = 'center';
var u81 = document.getElementById('u81');
gv_vAlignTable['u81'] = 'top';
var u177 = document.getElementById('u177');

var u94 = document.getElementById('u94');
gv_vAlignTable['u94'] = 'top';
var u60 = document.getElementById('u60');

var u102 = document.getElementById('u102');

var u9 = document.getElementById('u9');
gv_vAlignTable['u9'] = 'center';
var u73 = document.getElementById('u73');

var u69 = document.getElementById('u69');
gv_vAlignTable['u69'] = 'center';
var u147 = document.getElementById('u147');

var u163 = document.getElementById('u163');
gv_vAlignTable['u163'] = 'top';
var u91 = document.getElementById('u91');

var u131 = document.getElementById('u131');
gv_vAlignTable['u131'] = 'center';
var u64 = document.getElementById('u64');

var u70 = document.getElementById('u70');
gv_vAlignTable['u70'] = 'top';
var u24 = document.getElementById('u24');

var u162 = document.getElementById('u162');
gv_vAlignTable['u162'] = 'top';
var u117 = document.getElementById('u117');

var u13 = document.getElementById('u13');
gv_vAlignTable['u13'] = 'top';
var u113 = document.getElementById('u113');
gv_vAlignTable['u113'] = 'center';
var u29 = document.getElementById('u29');
gv_vAlignTable['u29'] = 'top';
var u132 = document.getElementById('u132');
gv_vAlignTable['u132'] = 'top';
var u175 = document.getElementById('u175');

var u129 = document.getElementById('u129');

var u86 = document.getElementById('u86');
gv_vAlignTable['u86'] = 'center';
var u58 = document.getElementById('u58');

var u183 = document.getElementById('u183');
gv_vAlignTable['u183'] = 'center';
var u173 = document.getElementById('u173');

var u111 = document.getElementById('u111');
gv_vAlignTable['u111'] = 'top';
var u171 = document.getElementById('u171');

var u0 = document.getElementById('u0');

var u31 = document.getElementById('u31');
gv_vAlignTable['u31'] = 'center';
var u83 = document.getElementById('u83');

var u178 = document.getElementById('u178');

var u8 = document.getElementById('u8');

var u3 = document.getElementById('u3');
gv_vAlignTable['u3'] = 'center';
var u96 = document.getElementById('u96');

var u146 = document.getElementById('u146');
gv_vAlignTable['u146'] = 'top';
var u15 = document.getElementById('u15');

var u49 = document.getElementById('u49');
gv_vAlignTable['u49'] = 'top';
var u124 = document.getElementById('u124');
gv_vAlignTable['u124'] = 'center';
var u80 = document.getElementById('u80');
gv_vAlignTable['u80'] = 'center';
var u1 = document.getElementById('u1');
gv_vAlignTable['u1'] = 'center';
var u148 = document.getElementById('u148');

var u93 = document.getElementById('u93');
gv_vAlignTable['u93'] = 'top';
var u167 = document.getElementById('u167');
gv_vAlignTable['u167'] = 'top';
var u145 = document.getElementById('u145');
gv_vAlignTable['u145'] = 'center';
var u12 = document.getElementById('u12');
gv_vAlignTable['u12'] = 'top';
var u165 = document.getElementById('u165');

var u25 = document.getElementById('u25');
gv_vAlignTable['u25'] = 'center';
var u59 = document.getElementById('u59');
gv_vAlignTable['u59'] = 'center';
var u137 = document.getElementById('u137');
gv_vAlignTable['u137'] = 'top';
var u90 = document.getElementById('u90');
gv_vAlignTable['u90'] = 'top';
var u18 = document.getElementById('u18');
gv_vAlignTable['u18'] = 'top';
var u161 = document.getElementById('u161');

var u45 = document.getElementById('u45');

var u77 = document.getElementById('u77');
gv_vAlignTable['u77'] = 'top';
var u22 = document.getElementById('u22');
gv_vAlignTable['u22'] = 'top';
var u143 = document.getElementById('u143');
gv_vAlignTable['u143'] = 'top';
var u107 = document.getElementById('u107');
gv_vAlignTable['u107'] = 'center';
var u35 = document.getElementById('u35');

var u136 = document.getElementById('u136');
gv_vAlignTable['u136'] = 'top';
var u180 = document.getElementById('u180');

var u28 = document.getElementById('u28');
gv_vAlignTable['u28'] = 'top';
if (window.OnLoad) OnLoad();
