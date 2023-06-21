enable_testing()

find_package(GTest REQUIRED)

function(add_gtest testname)
    add_executable(${testname} ${testname}.cc)
    target_include_directories(${testname} PRIVATE ../src)
    target_link_libraries(${testname} gtest::gtest)
    add_test(NAME ${testname} COMMAND ${testname})
endfunction()

add_gtest(test_archiver.cc)
add_gtest(test_reader.cc)
add_gtest(test_writer.cc)
