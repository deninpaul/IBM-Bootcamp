#!/usr/bin/env sh

usage() {
    echo "Usage: "
    echo "book.sh list"
    echo "book.sh create -title <title> -author <author> -genre <genre>"
    echo "book.sh list -id <id>"
    echo "book.sh delete -id <id>"
}

get_books(){
    echo " "
    curl -s http://localhost:8080/books | jq
}

get_book_id(){
    echo " "
    curl -s http://localhost:8080/books/$1 | jq
}

create_book(){
    echo "Create Book"
    curl -i -X POST -H "Content-Type: application/json" -d '{"name":"'"$1"'","author":"'"$2"'", "genre":"'"$3"'"}'  http://localhost:8080/books
}

update_book(){
    echo "Update Book"
}

delete_book(){
    echo "Delete Book"
}

usage
get_books
get_book_id 1
create_book "Book101" "Author101" "Genre101"