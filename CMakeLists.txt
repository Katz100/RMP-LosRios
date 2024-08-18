cmake_minimum_required(VERSION 3.16)

project(RMP_LosRios VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick Sql Network)


qt_standard_project_setup()


qt_add_executable(appRMP_LosRios
    main.cpp
)


qt_add_qml_module(appRMP_LosRios
    URI RMP_LosRios
    VERSION 1.0
    QML_FILES
    Main.qml
    content/TopBar.qml
    SOURCES database.h database.cpp
    SOURCES config.h
    QML_FILES content/LoginMenu.qml
    QML_FILES content/HomePage.qml
    QML_FILES content/SignUpPage.qml
    QML_FILES content/ProfileSettings.qml
    RESOURCES
    images/icons8-eye-24.png
    images/icons8-hide-24.png
    QML_FILES content/Review.qml
    SOURCES networkmanager.h networkmanager.cpp
    QML_FILES DataModel.js


)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appRMP_LosRios PROPERTIES
    #    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appRMP_LosRios
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appRMP_LosRios
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Sql
    PRIVATE Qt6::Network
)



include(GNUInstallDirs)
install(TARGETS appRMP_LosRios
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)




