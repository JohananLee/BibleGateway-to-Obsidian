mkdir -p  index/index
mv *.md index/index/

prename 's/The Bible/圣经/g' */*/**.md
#修改地一层目录，带有序号
prename 's/1 Chronicles/13.历代志上/' */**
prename 's/1 Corinthians/46.哥林多前书/' */**
prename 's/1 John/62.约翰一书/' */**
prename 's/1 Kings/11.列王纪上/' */**
prename 's/1 Peter/60.彼得前书/' */**
prename 's/1 Samuel/9.撒母耳记上/' */**
prename 's/1 Thessalonians/52.帖撒罗尼迦前书/' */**
prename 's/1 Timothy/54.提摩太前书/' */**
prename 's/2 Chronicles/14.历代志下/' */**
prename 's/2 Corinthians/47.哥林多后书/' */**
prename 's/2 John/63.约翰二书/' */**
prename 's/2 Kings/12.列王纪下/' */**
prename 's/2 Peter/61.彼得后书/' */**
prename 's/2 Samuel/10.撒母耳记下/' */**
prename 's/2 Thessalonians/53.帖撒罗尼迦后书/' */**
prename 's/2 Timothy/55.提摩太后书/' */**
prename 's/3 John/64.约翰三书/' */**
prename 's/Acts/44.使徒行传/' */**
prename 's/Amos/30.阿摩司书/' */**
prename 's/Colossians/51.歌罗西书/' */**
prename 's/Daniel/27.但以理书/' */**
prename 's/Deuteronomy/5.申命记/' */**
prename 's/Ecclesiastes/21.传道书/' */**
prename 's/Ephesians/49.以弗所书/' */**
prename 's/Esther/17.以斯帖记/' */**
prename 's/Exodus/2.出埃及记/' */**
prename 's/Ezekiel/26.以西结书/' */**
prename 's/Ezra/15.以斯拉书/' */**
prename 's/Galatians/48.加拉太书/' */**
prename 's/Genesis/1.创世纪/' */**
prename 's/Habakkuk/35.哈巴谷书/' */**
prename 's/Haggai/37.哈该书/' */**
prename 's/Hebrews/58.希伯来书/' */**
prename 's/Hosea/28.何西阿书/' */**
prename 's/Isaiah/23.以赛亚书/' */**
prename 's/James/59.雅各书/' */**
prename 's/Jeremiah/24.耶利米书/' */**
prename 's/Job/18.约伯记/' */**
prename 's/Joel/29.约珥书/' */**
prename 's/John/43.约翰福音/' */**
prename 's/Jonah/32.约拿书/' */**
prename 's/Joshua/6.约书亚记/' */**
prename 's/Jude/65.犹大书/' */**
prename 's/Judges/7.士师记/' */**
prename 's/Lamentations/25.耶利米哀歌/' */**
prename 's/Leviticus/3.利未记/' */**
prename 's/Luke/42.路加福音/' */**
prename 's/Malachi/39.玛拉基书/' */**
prename 's/Mark/41.马可福音/' */**
prename 's/Matthew/40.马太福音/' */**
prename 's/Micah/33.弥迦书/' */**
prename 's/Nahum/34.那鸿书/' */**
prename 's/Nehemiah/16.尼希米记/' */**
prename 's/Numbers/4.民数记/' */**
prename 's/Obadiah/31.俄巴底亚书/' */**
prename 's/Philemon/57.斐利门书/' */**
prename 's/Philippians/50.腓力比书/' */**
prename 's/Proverbs/20.箴言/' */**
prename 's/Psalms/19.诗篇/' */**
prename 's/Revelation/66.启示录/' */**
prename 's/Romans/45.罗马人书/' */**
prename 's/Ruth/8.路得记/' */**
prename 's/Song of Solomon/22.雅歌/' */**
prename 's/Titus/56.提多书/' */**
prename 's/Zechariah/38.撒加利亚书/' */**
prename 's/Zephaniah/36.西番雅书/' */**

#修改第二层目录，没有序号
prename 's/1 Chronicles/历代志上/' */*/**
prename 's/1 Corinthians/哥林多前书/' */*/**
prename 's/1 John/约翰一书/' */*/**
prename 's/1 Kings/列王纪上/' */*/**
prename 's/1 Peter/彼得前书/' */*/**
prename 's/1 Samuel/撒母耳记上/' */*/**
prename 's/1 Thessalonians/帖撒罗尼迦前书/' */*/**
prename 's/1 Timothy/提摩太前书/' */*/**
prename 's/2 Chronicles/历代志下/' */*/**
prename 's/2 Corinthians/哥林多后书/' */*/**
prename 's/2 John/约翰二书/' */*/**
prename 's/2 Kings/列王纪下/' */*/**
prename 's/2 Peter/彼得后书/' */*/**
prename 's/2 Samuel/撒母耳记下/' */*/**
prename 's/2 Thessalonians/帖撒罗尼迦后书/' */*/**
prename 's/2 Timothy/提摩太后书/' */*/**
prename 's/3 John/约翰三书/' */*/**
prename 's/Acts/使徒行传/' */*/**
prename 's/Amos/阿摩司书/' */*/**
prename 's/Colossians/歌罗西书/' */*/**
prename 's/Daniel/但以理书/' */*/**
prename 's/Deuteronomy/申命记/' */*/**
prename 's/Ecclesiastes/传道书/' */*/**
prename 's/Ephesians/以弗所书/' */*/**
prename 's/Esther/以斯帖记/' */*/**
prename 's/Exodus/出埃及记/' */*/**
prename 's/Ezekiel/以西结书/' */*/**
prename 's/Ezra/以斯拉书/' */*/**
prename 's/Galatians/加拉太书/' */*/**
prename 's/Genesis/创世纪/' */*/**
prename 's/Habakkuk/哈巴谷书/' */*/**
prename 's/Haggai/哈该书/' */*/**
prename 's/Hebrews/希伯来书/' */*/**
prename 's/Hosea/何西阿书/' */*/**
prename 's/Isaiah/以赛亚书/' */*/**
prename 's/James/雅各书/' */*/**
prename 's/Jeremiah/耶利米书/' */*/**
prename 's/Job/约伯记/' */*/**
prename 's/Joel/约珥书/' */*/**
prename 's/John/约翰福音/' */*/**
prename 's/Jonah/约拿书/' */*/**
prename 's/Joshua/约书亚记/' */*/**
prename 's/Jude/犹大书/' */*/**
prename 's/Judges/士师记/' */*/**
prename 's/Lamentations/耶利米哀歌/' */*/**
prename 's/Leviticus/利未记/' */*/**
prename 's/Luke/路加福音/' */*/**
prename 's/Malachi/玛拉基书/' */*/**
prename 's/Mark/马可福音/' */*/**
prename 's/Matthew/马太福音/' */*/**
prename 's/Micah/弥迦书/' */*/**
prename 's/Nahum/那鸿书/' */*/**
prename 's/Nehemiah/尼希米记/' */*/**
prename 's/Numbers/民数记/' */*/**
prename 's/Obadiah/俄巴底亚书/' */*/**
prename 's/Philemon/斐利门书/' */*/**
prename 's/Philippians/腓力比书/' */*/**
prename 's/Proverbs/箴言/' */*/**
prename 's/Psalms/诗篇/' */*/**
prename 's/Revelation/启示录/' */*/**
prename 's/Romans/罗马人书/' */*/**
prename 's/Ruth/路得记/' */*/**
prename 's/Song of Solomon/雅歌/' */*/**
prename 's/Titus/提多书/' */*/**
prename 's/Zechariah/撒加利亚书/' */*/**
prename 's/Zephaniah/西番雅书/' */*/**


sed -i 's/1 Chronicles/历代志上/g' */*/**.md
sed -i 's/1 Corinthians/哥林多前书/g' */*/**.md
sed -i 's/1 John/约翰一书/g' */*/**.md
sed -i 's/1 Kings/列王纪上/g' */*/**.md
sed -i 's/1 Peter/彼得前书/g' */*/**.md
sed -i 's/1 Samuel/撒母耳记上/g' */*/**.md
sed -i 's/1 Thessalonians/帖撒罗尼迦前书/g' */*/**.md
sed -i 's/1 Timothy/提摩太前书/g' */*/**.md
sed -i 's/2 Chronicles/历代志下/g' */*/**.md
sed -i 's/2 Corinthians/哥林多后书/g' */*/**.md
sed -i 's/2 John/约翰二书/g' */*/**.md
sed -i 's/2 Kings/列王纪下/g' */*/**.md
sed -i 's/2 Peter/彼得后书/g' */*/**.md
sed -i 's/2 Samuel/撒母耳记下/g' */*/**.md
sed -i 's/2 Thessalonians/帖撒罗尼迦后书/g' */*/**.md
sed -i 's/2 Timothy/提摩太后书/g' */*/**.md
sed -i 's/3 John/约翰三书/g' */*/**.md
sed -i 's/Acts/使徒行传/g' */*/**.md
sed -i 's/Amos/阿摩司书/g' */*/**.md
sed -i 's/Colossians/歌罗西书/g' */*/**.md
sed -i 's/Daniel/但以理书/g' */*/**.md
sed -i 's/Deuteronomy/申命记/g' */*/**.md
sed -i 's/Ecclesiastes/传道书/g' */*/**.md
sed -i 's/Ephesians/以弗所书/g' */*/**.md
sed -i 's/Esther/以斯帖记/g' */*/**.md
sed -i 's/Exodus/出埃及记/g' */*/**.md
sed -i 's/Ezekiel/以西结书/g' */*/**.md
sed -i 's/Ezra/以斯拉书/g' */*/**.md
sed -i 's/Galatians/加拉太书/g' */*/**.md
sed -i 's/Genesis/创世纪/g' */*/**.md
sed -i 's/Habakkuk/哈巴谷书/g' */*/**.md
sed -i 's/Haggai/哈该书/g' */*/**.md
sed -i 's/Hebrews/希伯来书/g' */*/**.md
sed -i 's/Hosea/何西阿书/g' */*/**.md
sed -i 's/Isaiah/以赛亚书/g' */*/**.md
sed -i 's/James/雅各书/g' */*/**.md
sed -i 's/Jeremiah/耶利米书/g' */*/**.md
sed -i 's/Job/约伯记/g' */*/**.md
sed -i 's/Joel/约珥书/g' */*/**.md
sed -i 's/John/约翰福音/g' */*/**.md
sed -i 's/Jonah/约拿书/g' */*/**.md
sed -i 's/Joshua/约书亚记/g' */*/**.md
sed -i 's/Jude/犹大书/g' */*/**.md
sed -i 's/Judges/士师记/g' */*/**.md
sed -i 's/Lamentations/耶利米哀歌/g' */*/**.md
sed -i 's/Leviticus/利未记/g' */*/**.md
sed -i 's/Luke/路加福音/g' */*/**.md
sed -i 's/Malachi/玛拉基书/g' */*/**.md
sed -i 's/Mark/马可福音/g' */*/**.md
sed -i 's/Matthew/马太福音/g' */*/**.md
sed -i 's/Micah/弥迦书/g' */*/**.md
sed -i 's/Nahum/那鸿书/g' */*/**.md
sed -i 's/Nehemiah/尼希米记/g' */*/**.md
sed -i 's/Numbers/民数记/g' */*/**.md
sed -i 's/Obadiah/俄巴底亚书/g' */*/**.md
sed -i 's/Philemon/斐利门书/g' */*/**.md
sed -i 's/Philippians/腓力比书/g' */*/**.md
sed -i 's/Proverbs/箴言/g' */*/**.md
sed -i 's/Psalms/诗篇/g' */*/**.md
sed -i 's/Revelation/启示录/g' */*/**.md
sed -i 's/Romans/罗马人书/g' */*/**.md
sed -i 's/Ruth/路得记/g' */*/**.md
sed -i 's/Song of Solomon/雅歌/g' */*/**.md
sed -i 's/Titus/提多书/g' */*/**.md
sed -i 's/Zechariah/撒加利亚书/g' */*/**.md
sed -i 's/Zephaniah/西番雅书/g' */*/**.md

prename 's/1 Chron/代上/g' */*/**.md
prename 's/1 Cor/林前/g' */*/**.md
prename 's/1 John/约壹/g' */*/**.md
prename 's/1 Ki/王上/g' */*/**.md
prename 's/1 Pet/彼前/g' */*/**.md
prename 's/1 Sam/撒上/g' */*/**.md
prename 's/1 Thess/帖前/g' */*/**.md
prename 's/1 Tim/提前/g' */*/**.md
prename 's/2 Chron/代下/g' */*/**.md
prename 's/2 Cor/林后/g' */*/**.md
prename 's/2 John/约贰/g' */*/**.md
prename 's/2 Ki/王下/g' */*/**.md
prename 's/2 Pet/彼后/g' */*/**.md
prename 's/2 Sam/撒下/g' */*/**.md
prename 's/2 Thess/帖后/g' */*/**.md
prename 's/2 Tim/提后/g' */*/**.md
prename 's/3 John/约叁/g' */*/**.md
prename 's/Acts/徒/g' */*/**.md
prename 's/Am/摩/g' */*/**.md
prename 's/Col/西/g' */*/**.md
prename 's/Dan/但/g' */*/**.md
prename 's/Deut/申/g' */*/**.md
prename 's/Eccles/传/g' */*/**.md
prename 's/Ephes/弗/g' */*/**.md
prename 's/Esth/斯/g' */*/**.md
prename 's/Exod/出/g' */*/**.md
prename 's/Ezek/结/g' */*/**.md
prename 's/Ezr/拉/g' */*/**.md
prename 's/Gal/加/g' */*/**.md
prename 's/Gen/创/g' */*/**.md
prename 's/Hab/哈/g' */*/**.md
prename 's/Hag/该/g' */*/**.md
prename 's/Heb/来/g' */*/**.md
prename 's/Hos/何/g' */*/**.md
prename 's/Isa/赛/g' */*/**.md
prename 's/James/雅/g' */*/**.md
prename 's/Jer/耶/g' */*/**.md
prename 's/Job/伯/g' */*/**.md
prename 's/Joel/珥/g' */*/**.md
prename 's/John/约/g' */*/**.md
prename 's/Jonah/拿/g' */*/**.md
prename 's/Josh/书/g' */*/**.md
prename 's/Jude/犹/g' */*/**.md
prename 's/Judg/士/g' */*/**.md
prename 's/Lam/哀/g' */*/**.md
prename 's/Lev/利/g' */*/**.md
prename 's/Luke/路/g' */*/**.md
prename 's/Mal/玛/g' */*/**.md
prename 's/Mark/可/g' */*/**.md
prename 's/Matt/太/g' */*/**.md
prename 's/Micah/弥/g' */*/**.md
prename 's/Nah/鸿/g' */*/**.md
prename 's/Neh/尼/g' */*/**.md
prename 's/Num/民/g' */*/**.md
prename 's/Obad/俄/g' */*/**.md
prename 's/Philem/门/g' */*/**.md
prename 's/Phil/腓/g' */*/**.md
prename 's/Prov/箴/g' */*/**.md
prename 's/Ps/诗/g' */*/**.md
prename 's/Rev/启/g' */*/**.md
prename 's/Rom/罗/g' */*/**.md
prename 's/Ruth/得/g' */*/**.md
prename 's/Song/歌/g' */*/**.md
prename 's/Titus/多/g' */*/**.md
prename 's/Zech/亚/g' */*/**.md
prename 's/Zeph/番/g' */*/**.md

sed -i 's/1 Chron/代上/g' */*/**.md
sed -i 's/1 Cor/林前/g' */*/**.md
sed -i 's/1 John/约壹/g' */*/**.md
sed -i 's/1 Ki/王上/g' */*/**.md
sed -i 's/1 Pet/彼前/g' */*/**.md
sed -i 's/1 Sam/撒上/g' */*/**.md
sed -i 's/1 Thess/帖前/g' */*/**.md
sed -i 's/1 Tim/提前/g' */*/**.md
sed -i 's/2 Chron/代下/g' */*/**.md
sed -i 's/2 Cor/林后/g' */*/**.md
sed -i 's/2 John/约贰/g' */*/**.md
sed -i 's/2 Ki/王下/g' */*/**.md
sed -i 's/2 Pet/彼后/g' */*/**.md
sed -i 's/2 Sam/撒下/g' */*/**.md
sed -i 's/2 Thess/帖后/g' */*/**.md
sed -i 's/2 Tim/提后/g' */*/**.md
sed -i 's/3 John/约叁/g' */*/**.md
sed -i 's/Acts/徒/g' */*/**.md
sed -i 's/Am/摩/g' */*/**.md
sed -i 's/Col/西/g' */*/**.md
sed -i 's/Dan/但/g' */*/**.md
sed -i 's/Deut/申/g' */*/**.md
sed -i 's/Eccles/传/g' */*/**.md
sed -i 's/Ephes/弗/g' */*/**.md
sed -i 's/Esth/斯/g' */*/**.md
sed -i 's/Exod/出/g' */*/**.md
sed -i 's/Ezek/结/g' */*/**.md
sed -i 's/Ezr/拉/g' */*/**.md
sed -i 's/Gal/加/g' */*/**.md
sed -i 's/Gen/创/g' */*/**.md
sed -i 's/Hab/哈/g' */*/**.md
sed -i 's/Hag/该/g' */*/**.md
sed -i 's/Heb/来/g' */*/**.md
sed -i 's/Hos/何/g' */*/**.md
sed -i 's/Isa/赛/g' */*/**.md
sed -i 's/James/雅/g' */*/**.md
sed -i 's/Jer/耶/g' */*/**.md
sed -i 's/Job/伯/g' */*/**.md
sed -i 's/Joel/珥/g' */*/**.md
sed -i 's/John/约/g' */*/**.md
sed -i 's/Jonah/拿/g' */*/**.md
sed -i 's/Josh/书/g' */*/**.md
sed -i 's/Jude/犹/g' */*/**.md
sed -i 's/Judg/士/g' */*/**.md
sed -i 's/Lam/哀/g' */*/**.md
sed -i 's/Lev/利/g' */*/**.md
sed -i 's/Luke/路/g' */*/**.md
sed -i 's/Mal/玛/g' */*/**.md
sed -i 's/Mark/可/g' */*/**.md
sed -i 's/Matt/太/g' */*/**.md
sed -i 's/Micah/弥/g' */*/**.md
sed -i 's/Nah/鸿/g' */*/**.md
sed -i 's/Neh/尼/g' */*/**.md
sed -i 's/Num/民/g' */*/**.md
sed -i 's/Obad/俄/g' */*/**.md
sed -i 's/Philem/门/g' */*/**.md
sed -i 's/Phil/腓/g' */*/**.md
sed -i 's/Prov/箴/g' */*/**.md
sed -i 's/Ps/诗/g' */*/**.md
sed -i 's/Rev/启/g' */*/**.md
sed -i 's/Rom/罗/g' */*/**.md
sed -i 's/Ruth/得/g' */*/**.md
sed -i 's/Song/歌/g' */*/**.md
sed -i 's/Titus/多/g' */*/**.md
sed -i 's/Zech/亚/g' */*/**.md
sed -i 's/Zeph/番/g' */*/**.md

sed -i 's/(Chinese Union Version Modern Punctuation (Simplified))//g' */*/**.md
sed -i 's/The Bible/圣经/g' */*/**.md

mv index/index/*.md ./
find ./*/* -empty -type d -delete
find ./* -empty -type d -delete
find * -empty -type d -delete