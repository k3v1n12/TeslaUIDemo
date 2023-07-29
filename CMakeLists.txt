cmake_minimum_required(VERSION 3.16)

project(TeslaUIDemo VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick Positioning Location Sql OpenGL)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appTeslaUIDemo
    main.cpp
)

qt_add_qml_module(appTeslaUIDemo
    URI TeslaUIDemo
    VERSION 1.0
    QML_FILES Main.qml
    RESOURCES ui/assets/car.jpg ui/assets/caricon.png
    QML_FILES ui/BottomBar/BottomBar.qml
    QML_FILES ui/LeftScreen/LeftScreen.qml
    QML_FILES ui/RightScreen/RightScreen.qml
    SOURCES controller/system.h controller/system.cpp
    RESOURCES ui/assets/locked.png ui/assets/unlocked.png
    RESOURCES ui/assets/person.png
    QML_FILES ui/RightScreen/NavigationSearchBox.qml
    QML_FILES ui/RightScreen/MapDisplay.qml
    RESOURCES ui/assets/search.png
    SOURCES controller/hvachandler.h controller/hvachandler.cpp
    QML_FILES ui/BottomBar/HVACComponent.qml


)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appTeslaUIDemo PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appTeslaUIDemo
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appTeslaUIDemo
    PRIVATE Qt6::Quick
            Qt6::Location
            Qt6::Positioning
            Qt6::Sql
            Qt6::OpenGL
)

include(GNUInstallDirs)
install(TARGETS appTeslaUIDemo
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
