add_executable(
    ${PROJECT_NAME}
    main.cc
    archiver.cc
    heap.cc
    reader.cc
    trie.cc
    writer.cc
)

find_package(Boost REQUIRED)
target_link_libraries(${PROJECT_NAME} boost::boost)
