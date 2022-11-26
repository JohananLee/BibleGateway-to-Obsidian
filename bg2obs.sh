#!/bin/bash
#----------------------------------------------------------------------------------
# This script runs Jonathan clark's bg2md.rb ruby script and formats the output
# to be useful in Obsidian. Find the script here: https://github.com/jgclark/BibleGateway-to-Markdown
#
# It needs to be run in the same directory as the 'bg2md.rb' script and will output
# one .md file for each chapter, organising them in folders corresponding to the book.
# Navigation on the top and bottom is also added.
#
#----------------------------------------------------------------------------------
# SETTINGS
#----------------------------------------------------------------------------------
# Setting a different translation:
# Using the abbreviation with the -v flag, you can call on a different translation.
# It defaults to the "World English Bible", if you change the translation,
# make sure to honour the copyright restrictions.
#----------------------------------------------------------------------------------

usage() {
    echo "Usage: $0 [-beailncyh] [-v version]"
    echo "  -v version   Specify the translation to download (default = WEB)"
    echo "  -b    Set words of Jesus in bold"
    echo "  -e    Debug mode"
    echo "  -a    Create an alias in the YAML front matter for each chapter title"
    echo "  -i    Show download information (i.e. verbose mode)"
    echo "  -l    new line"
    echo "  -n    new line without headline"
    echo "  -t    Add title at line head"
    echo "  -c    Include inline navigation for the breadcrumbs plugin (e.g. 'up', 'next','previous')"
    echo "  -y    Print navigation for the breadcrumbs plugin (e.g. 'up', 'next','previous') in the frontmatter (YAML)"
    echo "  -h    Display help"
    exit 1
}

# Extract command line options

# Clear translation variable if it exists and set defaults for others
translation='WEB'          # Which translation to use
boldwords="false"          # Set words of Jesus in bold
aliases="false"            # Create an alias in the YAML front matter for each chapter title
verbose="false"            # Show download progress for each chapter
newline="false"            # newline
newheadline="false"        # newline without headline
debug_flag="false"         # Show debug info
breadcrumbs_inline="false" # Print breadcrumbs in the file
breadcrumbs_yaml="false"   # Print breadcrumbs in the YAML
newtitle="false"

# Process command line args
while getopts 'v:beailntcy?h' c; do
    case $c in
        v) translation=$OPTARG ;;
        b) boldwords="true" ;;
        e) debug_flag="true" ;;
        a) aliases="true" ;;
        i) verbose="true" ;;
        l) newline="true" ;;
        n) newheadline="true" ;;
        t) newtitle="true" ;;
        c) breadcrumbs_inline="true" ;;
        y) breadcrumbs_yaml="true" ;;
        h | ?) usage ;;
    esac
done

# Copyright disclaimer
echo "I confirm that I have checked and understand the copyright/license conditions for ${translation} and wish to continue downloading it in its entirety.?"
select yn in "Yes" "No"; do
    case $yn in
        Yes) break ;;
        No) exit ;;
    esac
done

# Copyright disclaimer
echo "Only format?"
select yn in "Yes" "No"; do
    case $yn in
        Yes)
            # Clear unnecessary headers
            find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/#.*(#####\D[1]\D)/#$1/g'
            
            # Format verses
            #find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/######\s([0-9]\s|[0-9][0-9]\s|[0-9][0-9][0-9]\s)/\n\n###### $1\n/g'
            #Perl 的正则表达式中如果出现 () ，则发生匹配或替换后 () 内的模式被 Perl 解释器自动依次赋给系统 $1, $2
            if [[ ${newheadline} = "true" ]]; then
                find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/######\s([0-9]|[0-9][0-9]|[0-9][0-9][0-9])\s/\n$1./g'
            else
                find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/######\s([0-9]|[0-9][0-9]|[0-9][0-9][0-9])\s/### $1./g'
            fi
            find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/####.+$//g'
            find . -name "*.md" -print0 | xargs -0 perl -0777pi -e 's/\n\n\n/\n\n/g'
            
            # Delete crossreferences
            find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/\<crossref intro.*crossref\>//g'
            exit
        ;;
        No)  break;;
    esac
done

# Check bg2md.rb
FILErb=./bg2md.rb
if [ -f "$FILErb" ]; then
    echo "$FILErb exists."
else
    echo "$FILErb does not exist. Download now."
    git clone https://github.com/jgclark/BibleGateway-to-Markdown.git
    mv BibleGateway-to-Markdown/bg2md.rb ./
    rm -rf BibleGateway-to-Markdown
fi
cn_version=(ERV-ZH CNVS CNVT CSBS CSBT CUVS CUV CUVMPS CUVMPT RCU17SS RCU17TS)
# Initialize variables
book_counter=0      # Setting the counter to 0
book_counter_max=66 # Setting the max amount to 66, since there are 66 books we want to import

# Book list
declare -a bookarray   # Declaring the Books of the Bible as a list
declare -a abbarray    # Delaring the abbreviations for each book. You can adapt if you'd like
declare -a lengtharray # Declaring amount of chapters in each book

# -------------------------------------------
# TRANSLATION: Lists of Names
# -------------------------------------------
# For Translation, translate these three lists. Seperated by space and wrapped in quotes if they include whitespace.
# Name of "The Bible" in your language
biblename="The Bible (${translation})"
# Full names of the books of the Bible
bookarray=(Genesis Exodus Leviticus Numbers Deuteronomy Joshua Judges Ruth "1 Samuel" "2 Samuel" "1 Kings" "2 Kings" "1 Chronicles" "2 Chronicles" Ezra Nehemiah Esther Job Psalms Proverbs Ecclesiastes "Song of Solomon" Isaiah Jeremiah Lamentations Ezekiel Daniel Hosea Joel Amos Obadiah Jonah Micah Nahum Habakkuk Zephaniah Haggai Zechariah Malachi Matthew Mark Luke John Acts Romans "1 Corinthians" "2 Corinthians" Galatians Ephesians Philippians Colossians "1 Thessalonians" "2 Thessalonians" "1 Timothy" "2 Timothy" Titus Philemon Hebrews James "1 Peter" "2 Peter" "1 John" "2 John" "3 John" Jude Revelation)
#bookarray=(Genesis)
# Short names of the books of the Bible
abbarray=(Gen Exod Lev Num Deut Josh Judg Ruth "1 Sam" "2 Sam" "1 Kings" "2 Kings" "1 Chron" "2 Chron" Ezr Neh Esth Job Ps Prov Eccles Song Isa Jer Lam Ezek Dan Hos Joel Am Obad Jonah Micah Nah Hab Zeph Hag Zech Mal Matt Mark Luke John Acts Rom "1 Cor" "2 Cor" Gal Ephes Phil Col "1 Thess" "2 Thess" "1 Tim" "2 Tim" Titus Philem Heb James "1 Pet" "2 Pet" "1 John" "2 John" "3 John" Jude Rev)
cn_abbarray=(创 出 利 民 申 书 士 得 撒上 撒下 王上 王下 代上 代下 拉 尼 斯 伯 诗 箴 传 歌 赛 耶 哀 结 但 何 珥 摩 俄 拿 弥 鸿 哈 番 该 亚 玛 太 可 路 约 徒 罗 林前 林后 加 弗 腓 西 帖前 帖后 提前 提后 多 门 来 雅 彼前 彼后 约1 约2 约3 犹 启)

# -------------------------------------------
# Chinese book name
cn_bookarray=(创世纪 出埃及记 利未记 民数记 申命记 约书亚记 士师记 路得记 撒母耳记上 撒母耳记下 列王纪上 列王纪下 历代志上 历代志下 以斯拉书 尼希米记 以斯帖记 约伯记 诗篇 箴言 传道书 雅歌 以赛亚书 耶利米书 耶利米哀歌 以西结书 但以理书 何西阿书 约珥书 阿摩司书 俄巴底亚书 约拿书 弥迦书 那鸿书 哈巴谷书 西番雅书 哈该书 撒迦利亚书 玛拉基书 马太福音 马可福音 路加福音 约翰福音 使徒行传 罗马书 哥林多前书 哥林多后书 加拉太书 以弗所书 腓力比书 歌罗西书 帖撒罗尼迦前书 帖撒罗尼迦后书 提摩太前书 提摩太后书 提多书 斐利门书 希伯来书 雅各书 彼得前书 彼得后书 约翰一书 约翰二书 约翰三书 犹大书 启示录)
#cn_bookarray=(创世纪)

# Book chapter list
lengtharray=(50 40 27 36 34 24 21 4 31 24 22 25 29 36 10 13 10 42 150 31 12 8 66 52 5 48 12 14 3 9 1 4 7 3 3 3 2 14 4 28 16 24 21 28 16 16 13 6 6 4 4 5 3 6 4 3 1 13 5 5 3 5 1 1 1 22)
#lengtharray=(5)

iscnbook="false"
for element in "${cn_version[@]}"; do
    if [ "$translation" = "$element" ]; then
        iscnbook="true"
        biblename="圣经(${translation})"
    fi
done

echo "delete ${biblename}"
rm -rf "${biblename}"
rm -rf "${biblename}.md"

# Initialise the "The Bible" file for all of the books
echo -e "# ${biblename}\n" >>"${biblename}.md"

if [[ $verbose = "true" ]]; then
    echo "Starting download of ${translation} Bible."
fi

# Cycling through the book counter, setting which book and its maxchapter
for ((book_counter = 0; book_counter <= book_counter_max; book_counter++)); do
    if [[ $verbose = "true" ]]; then
        echo "" # Make a new line which the '-n' flag to the echo command prevents.
    fi
    
    book=${bookarray[$book_counter]}
    if [ "$iscnbook" = "true" ]; then
        book=${cn_bookarray[$book_counter]}
    fi
    
    book_get=${bookarray[$book_counter]}
    maxchapter=${lengtharray[$book_counter]}
    abbreviation=${abbarray[$book_counter]}
    cur_abbarray=${abbreviation}
    if [ "$iscnbook" = "true" ]; then
        cur_abbarray=${cn_abbarray[$book_counter]}
    fi

    if [[ $verbose = "true" ]]; then
        echo -n "${book} "
    fi
    
    folder_counter=$(($book_counter + 1))
    
    for ((chapter = 1; chapter <= maxchapter; chapter++)); do
        
        if [[ $verbose = "true" ]]; then
            echo -n "."
        fi
        
        ((prev_chapter = chapter - 1)) # Counting the previous and next chapter for navigation
        ((next_chapter = chapter + 1))
        
        # Exporting
        export_prefix="${book}"          # Setting the first half of the filename
        filename=${export_prefix}$chapter # Setting the filename
        
        prev_file=${export_prefix}$prev_chapter # Naming previous and next files
        next_file=${export_prefix}$next_chapter
        
        # Navigation with INLINE BREADCRUMBS DISABLED and YAML DISABLED – write normal navigation
        if [[ $breadcrumbs_inline = "false" && $breadcrumbs_yaml = "false" ]]; then
            
            # Formatting Navigation and omitting links that aren't necessary
            if [[ $maxchapter = 1 ]]; then
                # For a book that only has one chapter
                navigation="[[${book}]]"
                elif [[ $chapter = $maxchapter ]]; then
                # If this is the last chapter of the book
                navigation="[[${prev_file}|← ${book}${prev_chapter}]] | [[${book}]]"
                elif [[ ${chapter} = 1 ]]; then
                # If this is the first chapter of the book
                navigation="[[${book}]] | [[${next_file}|${book}${next_chapter} →]]"
            else
                # Navigation for everything else
                navigation="[[${prev_file}|← ${book}${prev_chapter}]] | [[${book}]] | [[${next_file}|${book}${next_chapter} →]]"
            fi
        fi
        
        # Navigation with INLINE BREADCRUMBS ENABLED
        if [[ $iscnbook = "true" ]]; then
            # Navigation with INLINE BREADCRUMBS ENABLED
            if [[ $breadcrumbs_inline = "true" ]]; then
                # Formatting Navigation and omitting links that aren't necessary
                if [[ ${maxchapter} = 1 ]]; then
                    # For a book that only has one chapter
                    navigation="(目录:: [[${book}]])"
                    elif [[ $chapter = $maxchapter ]]; then
                    # If this is the last chapter of the book
                    navigation="(上一章:: [[${prev_file}|← ${book}${prev_chapter}]]) | (目录:: [[${book}]])"
                    elif [[ $chapter = 1 ]]; then
                    # If this is the first chapter of the book
                    navigation="(目录:: [[${book}]]) | (下一章:: [[${next_file}|${book}${next_chapter} →]])"
                else
                    # Navigation for everything else
                    navigation="(上一章:: [[${prev_file}|← ${book}${prev_chapter}]]) | (目录:: [[${book}]]) | (下一章:: [[${next_file}|${book}${next_chapter} →]])"
                fi
            fi
        else
            # Navigation with INLINE BREADCRUMBS ENABLED
            if [[ $breadcrumbs_inline = "true" ]]; then
                # Formatting Navigation and omitting links that aren't necessary
                if [[ ${maxchapter} = 1 ]]; then
                    # For a book that only has one chapter
                    navigation="(up:: [[${book}]])"
                    elif [[ $chapter = $maxchapter ]]; then
                    # If this is the last chapter of the book
                    navigation="(previous:: [[${prev_file}|← ${book}${prev_chapter}]]) | (up:: [[${book}]])"
                    elif [[ $chapter = 1 ]]; then
                    # If this is the first chapter of the book
                    navigation="(up:: [[${book}]]) | (next:: [[${next_file}|${book}${next_chapter} →]])"
                else
                    # Navigation for everything else
                    navigation="(previous:: [[${prev_file}|← ${book}${prev_chapter}]]) | (up:: [[${book}]]) | (next:: [[${next_file}|${book}${next_chapter} →]])"
                fi
            fi
            
        fi
        for ((try = 1; try <= 5; try++)); do
            if [[ $boldwords = "true" ]]; then
                if [[ $newline = "true" ]]; then
                    text=$(ruby bg2md.rb -c -b -f -l -r -v "${translation}" "${book_get} ${chapter}") # This calls the 'bg2md_mod' script
                else
                    text=$(ruby bg2md.rb -c -b -f -r -v "${translation}" "${book_get} ${chapter}") # This calls the 'bg2md_mod' script
                fi
            else
                if [[ $newline = "true" ]]; then
                    text=$(ruby bg2md.rb -c -f -l -r -v "${translation}" "${book_get} ${chapter}") # This calls the 'bg2md_mod' script
                else
                    text=$(ruby bg2md.rb -c -f -r -v "${translation}" "${book_get} ${chapter}") # This calls the 'bg2md_mod' script
                fi
                
            fi
            RESULT=$?
            if [ $RESULT -eq 0 ]; then
                break
            fi
        done
        if [[ $debug_flag = "true" ]]; then
            echo "${text}"
            echo "${translation}" "${book} ${chapter}"
            echo "Continue?"
            select yn in "Yes" "No"; do
                case $yn in
                    Yes) break ;;
                    No) exit ;;
                esac
            done
        fi

        text=$(echo "$text" | sed 's/^(.*?)v1/v1/') # Deleting unwanted headers
        if [[ ${newtitle} = "true" ]]; then
            if [[ ${newheadline} = "true" ]]; then
                text=$(echo "$text" | sed "s/###### /\n${cur_abbarray} ${chapter}:/g") # Deleting unwanted headers
            else
                text=$(echo "$text" | sed "s/###### /${cur_abbarray} ${chapter}:/g") # Deleting unwanted headers
            fi
        fi

        if [[ $debug_flag = "true" ]]; then
            echo "${text}"
            echo "Continue?"
            select yn in "Yes" "No"; do
                case $yn in
                    Yes) break ;;
                    No) exit ;;
                esac
            done
        fi
        
        # Formatting the title for markdown
        title="# ${book} ${chapter}"
        
        # Navigation format
        if [[ $breadcrumbs_yaml = "true" ]]; then
            export="${title}\n***\n\n$text"
        else
            export="${title}\n\n$navigation\n***\n\n$text\n\n***\n$navigation"
        fi
        
        # YAML
        yaml_start="---\n"
        yaml_end="\n---\n"
        alias="Aliases: [${book} ${chapter}]" # Add other aliases or 'Tags:' here if desired. Make sure to follow proper YAML format.
        
        # Navigation with INLINE BREADCRUMBS ENABLED
        if [[ $iscnbook = "true" ]]; then
            if [[ $breadcrumbs_yaml = "true" ]]; then
                # Formatting Navigation and omitting links that aren't necessary
                if [[ $maxchapter = 1 ]]; then
                    # For a book that only has one chapter
                    bc_yaml="目录: ['${book}']"
                    elif [[ $chapter = $maxchapter ]]; then
                    # If this is the last chapter of the book
                    bc_yaml="上一章: ['${prev_file}']\nup: ['${book}']"
                    elif [[ $chapter = 1 ]]; then
                    # If this is the first chapter of the book
                    bc_yaml="目录: ['${book}']\n下一章: ['${next_file}']"
                else
                    # Navigation for everything else
                    bc_yaml="目录: ['${book}']\n上一章: ['${prev_file}']\n下一章: ['${next_file}']"
                fi
            fi
        else
            if [[ $breadcrumbs_yaml = "true" ]]; then
                # Formatting Navigation and omitting links that aren't necessary
                if [[ $maxchapter = 1 ]]; then
                    # For a book that only has one chapter
                    bc_yaml="up: ['${book}']"
                    elif [[ $chapter = $maxchapter ]]; then
                    # If this is the last chapter of the book
                    bc_yaml="previous: ['${prev_file}']\nup: ['${book}']"
                    elif [[ $chapter = 1 ]]; then
                    # If this is the first chapter of the book
                    bc_yaml="up: ['${book}']\nnext: ['${next_file}']"
                else
                    # Navigation for everything else
                    bc_yaml="up: ['${book}']\nprevious: ['${prev_file}']\nnext: ['${next_file}']"
                fi
            fi
        fi
        
        # Printing YAML
        if [ ${aliases} == "true" ] && [ ${breadcrumbs_yaml} == "false" ]; then
            yaml="${yaml_start}${alias}${yaml_end}"
            elif [ ${aliases} == "true" ] && [ ${breadcrumbs_yaml} == "true" ]; then
            yaml="${yaml_start}${alias}\n${bc_yaml}${yaml_end}"
            elif [ ${aliases} == "false" ] && [ ${breadcrumbs_yaml} == "true" ]; then
            yaml="${yaml_start}${bc_yaml}${yaml_end}"
        fi
        
        export="${yaml}${export}"
        # Export
        echo -e "$export" >>"$filename.md"
        
        # Creating a folder
        folder_name="${folder_counter}.${book}" # Setting the folder name
        # Creating a folder for the book of the Bible if it doesn't exist, otherwise moving new file into existing folder
        mkdir -p "./${biblename}/${folder_name}"
        mv "${filename}".md "./${biblename}/${folder_name}"
        
    done
    # End of the book exporting loop
    
    # Create an overview file for each book of the Bible:
    overview_file="links: [[${biblename}]]\n# ${book}\n\n"
    echo -e $overview_file >>"$book.md"
    for ((titlecount = 1; titlecount <= maxchapter; titlecount++)); do
        overview_file="${book} ${titlecount} -> [[${book}${titlecount} ]]"
        echo -e $overview_file >>"$book.md"
    done
    mv "$book.md" "./${biblename}/${folder_name}"
    
    # Append the bookname to "The Bible" file
    echo -e "* [[${book}]]" >>"${biblename}.md"
done

# Tidy up the Markdown files by removing unneeded headers and separating the verses
# with some blank space and an H6-level verse number.
#
# Using a perl one-liner here in order to help ensure that this works across platforms
# since the sed utility works differently on macOS and Linux variants. The perl should
# work consistently.

if [[ $verbose = "true" ]]; then
    echo ""
    echo "Cleaning up the Markdown files."
fi

# Do a backup
mkdir -p Backup
tar czf Backup/"${biblename}.tar.gz" "${biblename}" "${biblename}.md"
echo "backup finish"

# Copyright disclaimer
echo "Format verses?"
select yn in "Yes" "No"; do
    case $yn in
        Yes) break ;;
        No) exit ;;
    esac
done


# Clear unnecessary headers
find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/#.*(#####\D[1]\D)/#$1/g'

# Format verses
#find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/######\s([0-9]\s|[0-9][0-9]\s|[0-9][0-9][0-9]\s)/\n\n###### $1\n/g'
#Perl 的正则表达式中如果出现 () ，则发生匹配或替换后 () 内的模式被 Perl 解释器自动依次赋给系统 $1, $2
if [[ ${newheadline} = "true" ]]; then
    find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/######\s([0-9]|[0-9][0-9]|[0-9][0-9][0-9])\s/\n$1./g'
else
    find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/######\s([0-9]|[0-9][0-9]|[0-9][0-9][0-9])\s/### $1./g'
fi
find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/####.+$//g'
find . -name "*.md" -print0 | xargs -0 perl -0777pi -e 's/\n\n\n/\n\n/g'

# Delete crossreferences
find . -name "*.md" -print0 | xargs -0 perl -pi -e 's/\<crossref intro.*crossref\>//g'

if [[ $verbose = "true" ]]; then
    echo "Download complete. Markdown files ready for Obsidian import."
fi
