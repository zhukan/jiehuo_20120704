﻿
var PageName = '考题广场首页';
var PageId = '05ab6155fe1e4a06bf15e247f228185b'
var PageUrl = '考题广场首页.html'
document.title = '考题广场首页';
var PageNotes = 
{
"pageName":"考题广场首页",
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

var u122 = document.getElementById('u122');
gv_vAlignTable['u122'] = 'center';
var u21 = document.getElementById('u21');

var u32 = document.getElementById('u32');
gv_vAlignTable['u32'] = 'center';
var u252 = document.getElementById('u252');

var u156 = document.getElementById('u156');
gv_vAlignTable['u156'] = 'center';
var u207 = document.getElementById('u207');

var u130 = document.getElementById('u130');
gv_vAlignTable['u130'] = 'center';
var u7 = document.getElementById('u7');
gv_vAlignTable['u7'] = 'top';
var u2 = document.getElementById('u2');
gv_vAlignTable['u2'] = 'top';
var u79 = document.getElementById('u79');
gv_vAlignTable['u79'] = 'top';
var u160 = document.getElementById('u160');
gv_vAlignTable['u160'] = 'center';
var u236 = document.getElementById('u236');
gv_vAlignTable['u236'] = 'center';
var u4 = document.getElementById('u4');
gv_vAlignTable['u4'] = 'center';
var u153 = document.getElementById('u153');

var u226 = document.getElementById('u226');
gv_vAlignTable['u226'] = 'top';
var u140 = document.getElementById('u140');

var u17 = document.getElementById('u17');

var u222 = document.getElementById('u222');

var u135 = document.getElementById('u135');

var u151 = document.getElementById('u151');

var u212 = document.getElementById('u212');
gv_vAlignTable['u212'] = 'center';
var u42 = document.getElementById('u42');

var u159 = document.getElementById('u159');

var u229 = document.getElementById('u229');
gv_vAlignTable['u229'] = 'center';
var u55 = document.getElementById('u55');
gv_vAlignTable['u55'] = 'center';
var u101 = document.getElementById('u101');
gv_vAlignTable['u101'] = 'top';
var u186 = document.getElementById('u186');

var u14 = document.getElementById('u14');
gv_vAlignTable['u14'] = 'top';
var u48 = document.getElementById('u48');
gv_vAlignTable['u48'] = 'top';
var u105 = document.getElementById('u105');

var u27 = document.getElementById('u27');

var u235 = document.getElementById('u235');

var u138 = document.getElementById('u138');
gv_vAlignTable['u138'] = 'top';
var u52 = document.getElementById('u52');
gv_vAlignTable['u52'] = 'center';
var u20 = document.getElementById('u20');

var u67 = document.getElementById('u67');

var u65 = document.getElementById('u65');
gv_vAlignTable['u65'] = 'top';
var u120 = document.getElementById('u120');
gv_vAlignTable['u120'] = 'center';
var u152 = document.getElementById('u152');
gv_vAlignTable['u152'] = 'center';
var u110 = document.getElementById('u110');
gv_vAlignTable['u110'] = 'top';
var u6 = document.getElementById('u6');
gv_vAlignTable['u6'] = 'center';
var u205 = document.getElementById('u205');
gv_vAlignTable['u205'] = 'top';
var u108 = document.getElementById('u108');

var u247 = document.getElementById('u247');
gv_vAlignTable['u247'] = 'top';
var u37 = document.getElementById('u37');
gv_vAlignTable['u37'] = 'center';
var u238 = document.getElementById('u238');

var u251 = document.getElementById('u251');
gv_vAlignTable['u251'] = 'top';
var u62 = document.getElementById('u62');
gv_vAlignTable['u62'] = 'top';
var u141 = document.getElementById('u141');
gv_vAlignTable['u141'] = 'center';
var u11 = document.getElementById('u11');
gv_vAlignTable['u11'] = 'top';
var u75 = document.getElementById('u75');

var u133 = document.getElementById('u133');
gv_vAlignTable['u133'] = 'top';
var u200 = document.getElementById('u200');
gv_vAlignTable['u200'] = 'top';
var u34 = document.getElementById('u34');
gv_vAlignTable['u34'] = 'center';
var u68 = document.getElementById('u68');
gv_vAlignTable['u68'] = 'center';
var u89 = document.getElementById('u89');
gv_vAlignTable['u89'] = 'top';
var u39 = document.getElementById('u39');
gv_vAlignTable['u39'] = 'top';
var u47 = document.getElementById('u47');
gv_vAlignTable['u47'] = 'top';
var u213 = document.getElementById('u213');

var u184 = document.getElementById('u184');
gv_vAlignTable['u184'] = 'top';
var u185 = document.getElementById('u185');
gv_vAlignTable['u185'] = 'top';
var u72 = document.getElementById('u72');

var u103 = document.getElementById('u103');
gv_vAlignTable['u103'] = 'top';
var u164 = document.getElementById('u164');
gv_vAlignTable['u164'] = 'center';
var u99 = document.getElementById('u99');
gv_vAlignTable['u99'] = 'top';
var u233 = document.getElementById('u233');
gv_vAlignTable['u233'] = 'center';
var u66 = document.getElementById('u66');
gv_vAlignTable['u66'] = 'top';
var u112 = document.getElementById('u112');
gv_vAlignTable['u112'] = 'top';
var u44 = document.getElementById('u44');
gv_vAlignTable['u44'] = 'top';
var u78 = document.getElementById('u78');
gv_vAlignTable['u78'] = 'center';
var u179 = document.getElementById('u179');
gv_vAlignTable['u179'] = 'top';
var u231 = document.getElementById('u231');

var u57 = document.getElementById('u57');
gv_vAlignTable['u57'] = 'top';
var u191 = document.getElementById('u191');
gv_vAlignTable['u191'] = 'center';
var u16 = document.getElementById('u16');

var u203 = document.getElementById('u203');

var u125 = document.getElementById('u125');

var u41 = document.getElementById('u41');
gv_vAlignTable['u41'] = 'center';
var u172 = document.getElementById('u172');

var u246 = document.getElementById('u246');
gv_vAlignTable['u246'] = 'top';
var u149 = document.getElementById('u149');

var u54 = document.getElementById('u54');

var u208 = document.getElementById('u208');
gv_vAlignTable['u208'] = 'center';
var u118 = document.getElementById('u118');

var u197 = document.getElementById('u197');
gv_vAlignTable['u197'] = 'center';
var u88 = document.getElementById('u88');
gv_vAlignTable['u88'] = 'top';
var u189 = document.getElementById('u189');

var u38 = document.getElementById('u38');
gv_vAlignTable['u38'] = 'top';
var u176 = document.getElementById('u176');
gv_vAlignTable['u176'] = 'center';
var u26 = document.getElementById('u26');
gv_vAlignTable['u26'] = 'top';
var u174 = document.getElementById('u174');
gv_vAlignTable['u174'] = 'top';
var u216 = document.getElementById('u216');
gv_vAlignTable['u216'] = 'top';
var u128 = document.getElementById('u128');
gv_vAlignTable['u128'] = 'top';
var u85 = document.getElementById('u85');
gv_vAlignTable['u85'] = 'top';
var u51 = document.getElementById('u51');

var u182 = document.getElementById('u182');

var u249 = document.getElementById('u249');

var u241 = document.getElementById('u241');
gv_vAlignTable['u241'] = 'top';
var u243 = document.getElementById('u243');

var u10 = document.getElementById('u10');
gv_vAlignTable['u10'] = 'top';
var u100 = document.getElementById('u100');
gv_vAlignTable['u100'] = 'top';
var u0 = document.getElementById('u0');

var u144 = document.getElementById('u144');

var u202 = document.getElementById('u202');

var u166 = document.getElementById('u166');
gv_vAlignTable['u166'] = 'center';
var u82 = document.getElementById('u82');
gv_vAlignTable['u82'] = 'center';
var u36 = document.getElementById('u36');

var u30 = document.getElementById('u30');
gv_vAlignTable['u30'] = 'top';
var u219 = document.getElementById('u219');
gv_vAlignTable['u219'] = 'top';
var u95 = document.getElementById('u95');
gv_vAlignTable['u95'] = 'center';
var u61 = document.getElementById('u61');
gv_vAlignTable['u61'] = 'center';
var u195 = document.getElementById('u195');
gv_vAlignTable['u195'] = 'top';
var u116 = document.getElementById('u116');
gv_vAlignTable['u116'] = 'center';
var u158 = document.getElementById('u158');
gv_vAlignTable['u158'] = 'center';
var u74 = document.getElementById('u74');

var u123 = document.getElementById('u123');

var u223 = document.getElementById('u223');

var u114 = document.getElementById('u114');

var u33 = document.getElementById('u33');

var u253 = document.getElementById('u253');

var u157 = document.getElementById('u157');

var u221 = document.getElementById('u221');
gv_vAlignTable['u221'] = 'top';
var u92 = document.getElementById('u92');
gv_vAlignTable['u92'] = 'center';
var u46 = document.getElementById('u46');
gv_vAlignTable['u46'] = 'center';
var u126 = document.getElementById('u126');

var u71 = document.getElementById('u71');

var u181 = document.getElementById('u181');

var u198 = document.getElementById('u198');
gv_vAlignTable['u198'] = 'top';
var u5 = document.getElementById('u5');

var u98 = document.getElementById('u98');

var u214 = document.getElementById('u214');

var u127 = document.getElementById('u127');
gv_vAlignTable['u127'] = 'center';
var u225 = document.getElementById('u225');
gv_vAlignTable['u225'] = 'top';
var u43 = document.getElementById('u43');
gv_vAlignTable['u43'] = 'center';
var u169 = document.getElementById('u169');

var u240 = document.getElementById('u240');
gv_vAlignTable['u240'] = 'top';
var u56 = document.getElementById('u56');
gv_vAlignTable['u56'] = 'top';
var u150 = document.getElementById('u150');
gv_vAlignTable['u150'] = 'center';
var u187 = document.getElementById('u187');
gv_vAlignTable['u187'] = 'center';
var u142 = document.getElementById('u142');
gv_vAlignTable['u142'] = 'top';
var u106 = document.getElementById('u106');
gv_vAlignTable['u106'] = 'top';
var u168 = document.getElementById('u168');
gv_vAlignTable['u168'] = 'center';
var u154 = document.getElementById('u154');
gv_vAlignTable['u154'] = 'center';
var u40 = document.getElementById('u40');

var u227 = document.getElementById('u227');
gv_vAlignTable['u227'] = 'top';
var u139 = document.getElementById('u139');
gv_vAlignTable['u139'] = 'top';
var u87 = document.getElementById('u87');
gv_vAlignTable['u87'] = 'top';
var u53 = document.getElementById('u53');
gv_vAlignTable['u53'] = 'top';
var u193 = document.getElementById('u193');

var u104 = document.getElementById('u104');
gv_vAlignTable['u104'] = 'top';
var u192 = document.getElementById('u192');

var u121 = document.getElementById('u121');

var u250 = document.getElementById('u250');
gv_vAlignTable['u250'] = 'center';
var u211 = document.getElementById('u211');

var u19 = document.getElementById('u19');

var u242 = document.getElementById('u242');
gv_vAlignTable['u242'] = 'top';
var u155 = document.getElementById('u155');

var u206 = document.getElementById('u206');
gv_vAlignTable['u206'] = 'top';
var u109 = document.getElementById('u109');
gv_vAlignTable['u109'] = 'top';
var u84 = document.getElementById('u84');
gv_vAlignTable['u84'] = 'center';
var u50 = document.getElementById('u50');
gv_vAlignTable['u50'] = 'center';
var u239 = document.getElementById('u239');
gv_vAlignTable['u239'] = 'center';
var u97 = document.getElementById('u97');
gv_vAlignTable['u97'] = 'center';
var u63 = document.getElementById('u63');

var u170 = document.getElementById('u170');
gv_vAlignTable['u170'] = 'center';
var u76 = document.getElementById('u76');

var u134 = document.getElementById('u134');

var u81 = document.getElementById('u81');

var u228 = document.getElementById('u228');

var u177 = document.getElementById('u177');
gv_vAlignTable['u177'] = 'top';
var u209 = document.getElementById('u209');
gv_vAlignTable['u209'] = 'top';
var u94 = document.getElementById('u94');

var u60 = document.getElementById('u60');

var u190 = document.getElementById('u190');

var u102 = document.getElementById('u102');

var u9 = document.getElementById('u9');
gv_vAlignTable['u9'] = 'top';
var u73 = document.getElementById('u73');

var u69 = document.getElementById('u69');

var u234 = document.getElementById('u234');

var u147 = document.getElementById('u147');

var u163 = document.getElementById('u163');

var u91 = document.getElementById('u91');

var u131 = document.getElementById('u131');
gv_vAlignTable['u131'] = 'top';
var u64 = document.getElementById('u64');
gv_vAlignTable['u64'] = 'center';
var u70 = document.getElementById('u70');
gv_vAlignTable['u70'] = 'center';
var u24 = document.getElementById('u24');
gv_vAlignTable['u24'] = 'center';
var u188 = document.getElementById('u188');
gv_vAlignTable['u188'] = 'top';
var u230 = document.getElementById('u230');
gv_vAlignTable['u230'] = 'top';
var u23 = document.getElementById('u23');

var u204 = document.getElementById('u204');
gv_vAlignTable['u204'] = 'top';
var u117 = document.getElementById('u117');
gv_vAlignTable['u117'] = 'top';
var u210 = document.getElementById('u210');

var u13 = document.getElementById('u13');
gv_vAlignTable['u13'] = 'top';
var u113 = document.getElementById('u113');
gv_vAlignTable['u113'] = 'top';
var u29 = document.getElementById('u29');
gv_vAlignTable['u29'] = 'top';
var u132 = document.getElementById('u132');
gv_vAlignTable['u132'] = 'top';
var u175 = document.getElementById('u175');

var u217 = document.getElementById('u217');

var u129 = document.getElementById('u129');

var u86 = document.getElementById('u86');

var u58 = document.getElementById('u58');

var u183 = document.getElementById('u183');
gv_vAlignTable['u183'] = 'top';
var u173 = document.getElementById('u173');
gv_vAlignTable['u173'] = 'center';
var u111 = document.getElementById('u111');

var u171 = document.getElementById('u171');

var u119 = document.getElementById('u119');

var u31 = document.getElementById('u31');

var u232 = document.getElementById('u232');

var u83 = document.getElementById('u83');

var u178 = document.getElementById('u178');
gv_vAlignTable['u178'] = 'top';
var u8 = document.getElementById('u8');
gv_vAlignTable['u8'] = 'top';
var u3 = document.getElementById('u3');

var u96 = document.getElementById('u96');

var u146 = document.getElementById('u146');
gv_vAlignTable['u146'] = 'top';
var u196 = document.getElementById('u196');

var u15 = document.getElementById('u15');
gv_vAlignTable['u15'] = 'top';
var u49 = document.getElementById('u49');

var u124 = document.getElementById('u124');
gv_vAlignTable['u124'] = 'center';
var u80 = document.getElementById('u80');
gv_vAlignTable['u80'] = 'top';
var u1 = document.getElementById('u1');
gv_vAlignTable['u1'] = 'center';
var u245 = document.getElementById('u245');

var u148 = document.getElementById('u148');
gv_vAlignTable['u148'] = 'center';
var u93 = document.getElementById('u93');

var u167 = document.getElementById('u167');

var u145 = document.getElementById('u145');
gv_vAlignTable['u145'] = 'center';
var u237 = document.getElementById('u237');
gv_vAlignTable['u237'] = 'top';
var u12 = document.getElementById('u12');
gv_vAlignTable['u12'] = 'top';
var u201 = document.getElementById('u201');

var u165 = document.getElementById('u165');

var u199 = document.getElementById('u199');
gv_vAlignTable['u199'] = 'top';
var u25 = document.getElementById('u25');
gv_vAlignTable['u25'] = 'top';
var u59 = document.getElementById('u59');
gv_vAlignTable['u59'] = 'center';
var u215 = document.getElementById('u215');
gv_vAlignTable['u215'] = 'center';
var u137 = document.getElementById('u137');
gv_vAlignTable['u137'] = 'top';
var u244 = document.getElementById('u244');

var u90 = document.getElementById('u90');

var u18 = document.getElementById('u18');

var u248 = document.getElementById('u248');
gv_vAlignTable['u248'] = 'top';
var u161 = document.getElementById('u161');

var u224 = document.getElementById('u224');

var u45 = document.getElementById('u45');

var u77 = document.getElementById('u77');

var u22 = document.getElementById('u22');
gv_vAlignTable['u22'] = 'center';
var u143 = document.getElementById('u143');

var u220 = document.getElementById('u220');
gv_vAlignTable['u220'] = 'top';
var u107 = document.getElementById('u107');
gv_vAlignTable['u107'] = 'top';
var u162 = document.getElementById('u162');
gv_vAlignTable['u162'] = 'center';
var u35 = document.getElementById('u35');
gv_vAlignTable['u35'] = 'top';
var u136 = document.getElementById('u136');

var u218 = document.getElementById('u218');
gv_vAlignTable['u218'] = 'center';
var u180 = document.getElementById('u180');

var u28 = document.getElementById('u28');
gv_vAlignTable['u28'] = 'center';
var u194 = document.getElementById('u194');
gv_vAlignTable['u194'] = 'center';
if (window.OnLoad) OnLoad();
