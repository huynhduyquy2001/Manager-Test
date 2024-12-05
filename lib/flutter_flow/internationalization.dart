import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ko'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? koText = '',
  }) =>
      [enText, koText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // FirstPage
  {
    'zy1je9lp': {
      'en': 'QUIZ',
      'ko': '퀴즈 ',
    },
    'wx6fg9x5': {
      'en': 'Environment for teachers and students',
      'ko': '교사와 학생을 위한 학습 환경',
    },
    'uojnaekf': {
      'en': 'Teacher',
      'ko': '교사',
    },
    'l9i0mz4e': {
      'en': 'Student',
      'ko': '학생',
    },
    'gaoxav00': {
      'en': 'Home',
      'ko': '홈',
    },
  },
  // TestListPage
  {
    'gt2muz7u': {
      'en': 'Test list',
      'ko': '테스트 목록 ',
    },
    'c4qgh7ll': {
      'en': 'NO',
      'ko': 'NO',
    },
    'nfbh9kx1': {
      'en': 'Block',
      'ko': '차단',
    },
    'm1eiwy50': {
      'en': 'Book',
      'ko': '책',
    },
    'hewlm0ee': {
      'en': 'Lesson name',
      'ko': '수업 이름',
    },
    'eq9ic14x': {
      'en': 'Add new',
      'ko': '새로 추가 ',
    },
    'zteatx4z': {
      'en': 'Edit',
      'ko': '편집',
    },
    '7lwdscez': {
      'en': 'Delete',
      'ko': '삭제',
    },
    'a0mxp006': {
      'en': 'Home',
      'ko': '홈',
    },
  },
  // AddExamPage
  {
    'ymagjf3k': {
      'en': 'Add new lesson',
      'ko': '새로운 수업 추가',
    },
    '6qpio5q0': {
      'en': '새로 추가 ',
      'ko': '새로 추가 ',
    },
    'mhgkp9js': {
      'en': 'Sort',
      'ko': '정렬',
    },
    'baz9qzn0': {
      'en': 'Please enter test information',
      'ko': '테스트 정보를 입력해주세요.',
    },
    'r2zc39b2': {
      'en': 'Block',
      'ko': '차단',
    },
    'kgjmnpp5': {
      'en': 'Block',
      'ko': '차단',
    },
    '0ur2xbm5': {
      'en': 'Book name',
      'ko': '책 이름',
    },
    'yor0xfxz': {
      'en': 'Book name',
      'ko': '책 이름',
    },
    '7o4bg7j6': {
      'en': 'Lesson name',
      'ko': '수업 이름',
    },
    'hd7uhj6x': {
      'en': 'Lesson name',
      'ko': '수업 이름',
    },
    '4uyq7k0t': {
      'en': 'Add new question',
      'ko': '새로운 질문 추가',
    },
    'ldw0swvi': {
      'en': 'Home',
      'ko': '홈',
    },
  },
  // StudentInfo
  {
    '05wmge3p': {
      'en': 'Please enter your information',
      'ko': '정보를 입력해주세요',
    },
    'as8edow4': {
      'en': 'Your Name',
      'ko': '이름',
    },
    '8c7tpiuk': {
      'en': 'Name',
      'ko': '이름',
    },
    'yd70dc0n': {
      'en': 'School name',
      'ko': '학교 이름',
    },
    'fi64wlv2': {
      'en': 'School',
      'ko': '학교 ',
    },
    'a3bjkpwp': {
      'en': 'School year',
      'ko': '학년 ',
    },
    '8wjja4su': {
      'en': 'Year',
      'ko': '년',
    },
    '464q9hdn': {
      'en': 'Save',
      'ko': '저장',
    },
    'm12eo8mu': {
      'en': 'Home',
      'ko': '홈',
    },
  },
  // ExamSelectionPage
  {
    'ok9iky9h': {
      'en': 'Choose the test',
      'ko': '시험을 선택하세요',
    },
    't03t3qn5': {
      'en': 'Your information',
      'ko': '개인 정보',
    },
    'br7bsoq0': {
      'en': 'Your Name: ',
      'ko': '이름:',
    },
    'q59roxgv': {
      'en': 'Your Name:',
      'ko': '이름:',
    },
    'moeo8av4': {
      'en': 'School name: ',
      'ko': '학교 이름:',
    },
    'pg0wux0s': {
      'en': 'School name:',
      'ko': '학교 이름:',
    },
    'kywwp67f': {
      'en': 'School year: ',
      'ko': '학년:',
    },
    'rkxof65q': {
      'en': 'Class name:',
      'ko': '클래스 이름:',
    },
    'v613xqon': {
      'en': 'NO',
      'ko': 'NO',
    },
    '19770rgl': {
      'en': 'Block',
      'ko': '차단',
    },
    'eluu4t16': {
      'en': 'Book',
      'ko': '책',
    },
    '4namqult': {
      'en': 'Lesson name',
      'ko': '수업 이름',
    },
    '8ww5vvg3': {
      'en': 'Action',
      'ko': '액션',
    },
    'lmp20zup': {
      'en': 'Home',
      'ko': '홈',
    },
  },
  // ExamPage
  {
    '3txlejf1': {
      'en': 'Question',
      'ko': '질문',
    },
    'ycdtws6d': {
      'en': ':',
      'ko': ':',
    },
    'qkswnffm': {
      'en': 'Question 1:',
      'ko': '질문 1:',
    },
    'mrvu3bbf': {
      'en': 'Save',
      'ko': '저장',
    },
    'mxtxfxa7': {
      'en': 'Home',
      'ko': '홈',
    },
  },
  // ResultPage
  {
    '1mzobi34': {
      'en': 'Your Name: ',
      'ko': '이름:',
    },
    'jys6bhfe': {
      'en': 'Your Name:',
      'ko': '이름:',
    },
    'smq8cnlc': {
      'en': 'School name: ',
      'ko': '학교 이름:',
    },
    'lcmwzsfh': {
      'en': 'School name:',
      'ko': '학교 이름:',
    },
    'h9iysmsq': {
      'en': 'School year: ',
      'ko': '학년:',
    },
    'hw0i3cil': {
      'en': 'Class name:',
      'ko': '클래스 이름:',
    },
    '30vr66r0': {
      'en': 'Test name: ',
      'ko': '테스트 이름:',
    },
    'ad1uq1bs': {
      'en': 'Class name:',
      'ko': '클래스 이름:',
    },
    'w2ao5yyp': {
      'en': 'Results',
      'ko': '결과',
    },
    'x40xoczd': {
      'en': 'Total number of questions:',
      'ko': '총 질문 수:',
    },
    'k1nedpom': {
      'en': 'Number of correct answers:',
      'ko': '정답 수:',
    },
    'rbogwuli': {
      'en': 'Number of incorrect answers:',
      'ko': '오답 수:',
    },
    '79v4hpyy': {
      'en': 'The total number of essay questions:',
      'ko': '총 서술형 질문 수:',
    },
    'awiwenvl': {
      'en': 'Back',
      'ko': '돌아가기',
    },
    'w7tmpf5b': {
      'en': 'Question ',
      'ko': '질문',
    },
    '99gk8lnl': {
      'en': ':',
      'ko': ':',
    },
    'immqerge': {
      'en': 'Question 1:',
      'ko': '질문 1:',
    },
    'nii95lna': {
      'en': 'Home',
      'ko': '홈',
    },
  },
  // UpdateExamPage
  {
    't4x85904': {
      'en': 'Update lesson',
      'ko': '수업 업데이트',
    },
    'nshtgp44': {
      'en': 'Update',
      'ko': '업데이트',
    },
    'bgsjnvii': {
      'en': 'Sort',
      'ko': '정렬',
    },
    'f9rlzv75': {
      'en': 'Delete',
      'ko': '삭제',
    },
    'mmx36r05': {
      'en': 'Please enter test information',
      'ko': '테스트 정보를 입력해주세요.',
    },
    'j6b4tyl1': {
      'en': 'Block',
      'ko': '차단',
    },
    '2ubgm098': {
      'en': 'Block',
      'ko': '차단',
    },
    'qhboa8qi': {
      'en': 'Book name',
      'ko': '책 이름',
    },
    'u0ssvo5n': {
      'en': 'Book name',
      'ko': '책 이름',
    },
    'cepty40n': {
      'en': 'Lesson name',
      'ko': '수업 이름',
    },
    'rk2k1354': {
      'en': 'Lesson name',
      'ko': '수업 이름',
    },
    'kqeykeim': {
      'en': 'Add new question',
      'ko': '새로운 질문 추가',
    },
    'eefplkud': {
      'en': 'Home',
      'ko': '홈',
    },
  },
  // TeacherOptions
  {
    'dxa7nb64': {
      'en': 'Knowledge  & Skills',
      'ko': '지식 및 기술',
    },
    '3ynyyf42': {
      'en': 'Test management',
      'ko': '테스트 관리',
    },
    'ka545pyu': {
      'en': 'Export teacher answer file',
      'ko': '교사 답변 파일을 내보내주세요.',
    },
    'zwe4s5ey': {
      'en': 'Export student results file',
      'ko': '학생 결과 파일을 엑셀로 내보내세요.',
    },
    'bnwsjv06': {
      'en': '',
      'ko': '',
    },
    '5d5ivpm7': {
      'en': ' Log out!',
      'ko': '로그 아웃!',
    },
    'mufrf332': {
      'en': 'Home',
      'ko': '홈',
    },
  },
  // confirmPassword
  {
    'lhkyojvp': {
      'en': 'Please enter your password',
      'ko': '비밀번호를 입력하세요.',
    },
    '3657x0tz': {
      'en': 'Password',
      'ko': '비밀번호',
    },
    'nfleopb7': {
      'en': 'Send',
      'ko': '전송',
    },
  },
  // confirmSubmit
  {
    'vmw0k4xw': {
      'en': 'Are you sure you want to submit?',
      'ko': '제출하시겠습니까? ',
    },
    '3oc7p4h6': {
      'en': ' 아니요',
      'ko': ' 아니요',
    },
    'bn8ak3vb': {
      'en': 'Yes',
      'ko': '네',
    },
  },
  // chooseAnswer
  {
    'hgxhvwaa': {
      'en': 'Trung Quốc',
      'ko': '중국',
    },
    'aiapprf9': {
      'en': 'Hy Lạp',
      'ko': '그리스',
    },
    'p5fh2j2f': {
      'en': 'Champa',
      'ko': '참파',
    },
    'ruegoagd': {
      'en': 'Tây Tạng',
      'ko': '티베트',
    },
    '35usoroc': {
      'en': 'Enter your answer',
      'ko': '답을 입력하세요.',
    },
  },
  // enterQuestion
  {
    'xi8bvb31': {
      'en': 'Question: ',
      'ko': '질문 ',
    },
    '6iegrdqx': {
      'en': 'Question 1:',
      'ko': '질문 1:',
    },
    '85iw31d8': {
      'en': 'Index',
      'ko': '인덱스',
    },
    'xqvm2s19': {
      'en': '객관식',
      'ko': '객관식',
    },
    '2c7q9qm9': {
      'en': '서면 응답',
      'ko': '서면 응답',
    },
    'c4ix2700': {
      'en': 'Title',
      'ko': '제목',
    },
    '6qt7nhzb': {
      'en': 'A. ',
      'ko': 'A. ',
    },
    'rliyp5zi': {
      'en': 'Answer A',
      'ko': 'A 답',
    },
    'phu14zeh': {
      'en': 'B. ',
      'ko': 'B. ',
    },
    'pq0jvhoo': {
      'en': 'Answer B',
      'ko': 'B 답',
    },
    'vrt5kz4e': {
      'en': 'C. ',
      'ko': 'C.',
    },
    '9p56293v': {
      'en': 'Answer C',
      'ko': 'B 답',
    },
    'gfafawp1': {
      'en': 'D. ',
      'ko': 'D.',
    },
    '4oyh4axo': {
      'en': 'Answer D',
      'ko': 'D 답',
    },
    'zh8rg4mh': {
      'en': 'Đáp án: ',
      'ko': '정답:',
    },
    '5126kcbn': {
      'en': 'Search...',
      'ko': '검색 중... ',
    },
  },
  // confirmDeleteList
  {
    'y5nff07o': {
      'en': 'Do you want to delete Num tests?',
      'ko': '개의 테스트를 삭제하시겠습니까?',
    },
    'rr9c01ig': {
      'en': 'Do you want to delete 6 tests?',
      'ko': '테스트 6개를 삭제하시겠습니까?',
    },
    'ya1swb7t': {
      'en': 'No',
      'ko': ' 아니요',
    },
    '7mnwurtr': {
      'en': 'Yes',
      'ko': '네',
    },
  },
  // confirmDelete
  {
    'jzixtjqh': {
      'en': 'Do you want to delete this test?',
      'ko': '이 테스트를 삭제하시겠습니까?',
    },
    'v9o5z90b': {
      'en': 'Do you want to delete 6 tests?',
      'ko': '테스트 6개를 삭제하시겠습니까?',
    },
    'aqih3t43': {
      'en': 'No',
      'ko': ' 아니요',
    },
    '0i9o0eco': {
      'en': 'Yes',
      'ko': '네',
    },
  },
  // confirmNavigateBack
  {
    'f7xsdk21': {
      'en': 'Do you want to escape? The data has not been updated',
      'ko': '나가시겠습니까? 데이터가 업데이트되지 않았습니다.',
    },
    '8f3qs0u0': {
      'en': 'Do you want to delete 6 tests?',
      'ko': '테스트 6개를 삭제하시겠습니까?',
    },
    'eaxv305z': {
      'en': ' 아니요',
      'ko': ' 아니요',
    },
    'loin7780': {
      'en': '네',
      'ko': '네',
    },
  },
  // Miscellaneous
  {
    'rdy6zq9v': {
      'en': '',
      'ko': '',
    },
    '0cgml8ps': {
      'en': '',
      'ko': '',
    },
    'kroflxfe': {
      'en': '',
      'ko': '',
    },
    'h01gad9i': {
      'en': '',
      'ko': '',
    },
    '14u7d712': {
      'en': '',
      'ko': '',
    },
    'e0oaymbw': {
      'en': '',
      'ko': '',
    },
    't44jfleq': {
      'en': '',
      'ko': '',
    },
    'cjdlmh28': {
      'en': '',
      'ko': '',
    },
    'f202guu4': {
      'en': '',
      'ko': '',
    },
    'v95durvw': {
      'en': '',
      'ko': '',
    },
    'b0aqj8vx': {
      'en': '',
      'ko': '',
    },
    'siz7i99d': {
      'en': '',
      'ko': '',
    },
    'ogmfkqua': {
      'en': '',
      'ko': '',
    },
    '359ito7j': {
      'en': '',
      'ko': '',
    },
    'rczwdywz': {
      'en': '',
      'ko': '',
    },
    'lmk66gak': {
      'en': '',
      'ko': '',
    },
    'ldspi111': {
      'en': '',
      'ko': '',
    },
    'zdduptzv': {
      'en': '',
      'ko': '',
    },
    '60zd0ske': {
      'en': '',
      'ko': '',
    },
    'e4nyk3fn': {
      'en': '',
      'ko': '',
    },
    'fvlt3pxk': {
      'en': '',
      'ko': '',
    },
    '2bqog125': {
      'en': '',
      'ko': '',
    },
    'umc8dv1u': {
      'en': '',
      'ko': '',
    },
    'r1uh2074': {
      'en': '',
      'ko': '',
    },
    'evl73146': {
      'en': '',
      'ko': '',
    },
  },
].reduce((a, b) => a..addAll(b));
