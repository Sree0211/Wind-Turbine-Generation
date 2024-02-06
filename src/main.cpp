#include <iostream>
#include <cmath>
#include <GL/glut.h>
#include <fstream>
#include <chrono>
#include <thread>
#include <string>

/**
 * @file main.cpp
 * @author Sreenath Swaminathan
 * @brief Wind Turbine Simulation
 * @date 03.02.2023
 */

float bladeRotationAngle = 0.0f;  //!< Initial rotation angle
int currentIndex = 0;  //!< Index to get the speed from the file

/**
 * @brief Read the Speed data from file
 * 
 * This function captures the speed data from 1 (Min) 
 * to 10 (Max) speed at which the turbine blades are to be rotated
 * @return std::vector<float> Array containing speed data
 */


std::vector<float> readSpeedFromFile() 
{
    std::ifstream configFile("config.txt");
    std::vector<float> speed_data;
    if (configFile.is_open()) {
        std::string line;
        while (std::getline(configFile, line)) {
            size_t found = line.find("speed=");
            if (found != std::string::npos) {
                std::string speedStr = line.substr(found + 6); //!< Extract the speed value as a string
                float speed = std::stof(speedStr); //!< Convert the speed value to a float
                speed_data.push_back(speed);
            }
        }
        configFile.close();
    } else {
        std::cerr << "Unable to open config.txt" << std::endl;
    }
    return speed_data;
}

std::vector<float> SpeedData = readSpeedFromFile(); //!< Array to store the speed data from the file
int i = 1; //!< Index to denote Speed update

/**
 * @brief Update function for blade rotation
 * 
 * This function updates the rotation angle of turbine blades based on the speed from the file.
 * Speed is modified almost every 5 seconds.
 * 
 * @param value Timer value
 */

void update(int value) 
{

    //!< Updating the rotation speed
    bladeRotationAngle += 0.3f * SpeedData[currentIndex];  //!< Speed will be modified for  every 5 secs in this case

    //!< Schedule the next update
    glutTimerFunc(50, update, 0);
    i++;

    if(i%100==0) //!< Update function Progresses every millisecond
    {   
        //!< Block that increments the speed after every 5 seconds
        std::cout<<" Current Speed = "<< SpeedData[currentIndex]<<std::endl;
        currentIndex++;
        if (currentIndex == 10)
        {
            std::cout<<"Project ended"<<std::endl;
            exit(0);
        }
    }
    //!< Request a redraw
    glutPostRedisplay();
}

/**
 * @brief Function to draw a filled circle
 * 
 * This function draws a filled circle using GL_TRIANGLE_FAN.
 * 
 * @param cx X-coordinate of the center
 * @param cy Y-coordinate of the center
 * @param r Radius of the circle
 * @param num_segments Number of segments for circle approximation
 */

void drawFilledCircle(float cx, float cy, float r, int num_segments) 
{
    glBegin(GL_TRIANGLE_FAN);
    for (int i = 0; i <= num_segments; i++) {
        float theta = 2.0f * M_PI * float(i) / float(num_segments);
        float x = r * cosf(theta);
        float y = r * sinf(theta);
        glVertex2f(cx + x, cy + y);
    }
    glEnd();
}

/**
 * @brief Function to develop the structure of the turbine
 * 
 * This function creates the required structure to represent the WindTurbine
 * This includes a Pole as its base
 * A ciruclar structure and blades rotating about the center of that circle.
 * 
*/

void drawTurbineStructure() 
{

    //!< Pole like structure
    glBegin(GL_QUADS);
    glColor3f(1.0, 1.0, 1.0);
	glVertex2f(360, 40);
	glVertex2f(375, 40);
	glVertex2f(375, 480);
	glVertex2f(360, 480);
    glEnd();

    //!< Circle in the middle
    drawFilledCircle(367.5,480,8,100);

    //!< Rotating the object around the circle
    glPushMatrix();
    glTranslatef(367.5, 480, 0.0f);
    glRotatef(bladeRotationAngle, 0, 0, 1);

    //!< Blade 1 - Each blade is separated by almost 120 degrees
    glBegin(GL_TRIANGLES);
    glColor3f(1.0, 1.0, 1.0);
    glVertex2f(-5.5, 0); // Bottom left of the Triangluar blade
    glVertex2f(0,5.5); // Bottom left of the Triangluar blade
    glVertex2f(-100, 120); // Bottom center of the blade
    glEnd();

    //!< Blade 2
    glBegin(GL_TRIANGLES);
    glColor3f(1.0, 1.0, 1.0);
    glVertex2f(-5.5, 0);
    glVertex2f(0, -5.5);
    glVertex2f(-100, -120);
    glEnd();

    //!< Blade 3
    glBegin(GL_TRIANGLES);
    glColor3f(1.0, 1.0, 1.0);
    glVertex2f(0, 5.5);
    glVertex2f(0,-5.5);
    glVertex2f(136, 0);
    glEnd();

    glPopMatrix();
    
}

/**
 * @brief Display callback function
 * 
 * This function is performs the rendering of the wind turbine.
 */

void display() 
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    //!< Applying transformations and render the turbine structure
    drawTurbineStructure(); 
    glutSwapBuffers();
}

/**
 * @brief Keyboard callback function
 * 
 * This function handles keyboard input.
 * 
 * @param key ASCII code of the pressed key
 * @param x X-coordinate of the mouse when key was pressed
 * @param y Y-coordinate of the mouse when key was pressed
 */

void keyboard(unsigned char key, int x, int y) 
{
    //!< Handle keyboard input
    switch (key) {
        case 27:  // ASCII code for 'Escape' key
            exit(0);  // Terminate the program
            break;
    }
}

/**
 * @brief Main function
 * 
 * Entry point of the program.
 * 
 * @param argc Number of command-line arguments
 * @param argv Command-line argument values
 * @return int Exit status
 */

int main(int argc, char** argv) 
{

    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
    glutInitWindowSize(800,800);
    glutCreateWindow("Turbine Simulation");

    //! Set up the viewport, projection, etc.
    glClearColor(0.5f, 0.5f, 0.0f, 1.0f);
    glOrtho(0, 800, 0, 800,0,1);  // Orthographic Projection

    //! Register the display and reshape callback functions
    glEnable(GL_DEPTH_TEST);

    //! Function to display the Wind turbine
    glutDisplayFunc(display);
    
    glutTimerFunc(16, update, 0);

    //! Register the keyboard callback function
    glutKeyboardFunc(keyboard);

    glutMainLoop();
    return 0;
}



