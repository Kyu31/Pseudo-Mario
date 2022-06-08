# Pseudo-Mario

Group: The Construction Workers
Kelly Yu & Emily Young-squire
Design Document: https://docs.google.com/document/d/19JrPXRV1_NrcL2gPUvAZEUnofS-HoaCYgptBbROWiRk/edit?usp=sharing

Brief Summary:
    Our project will, in short, be a pseudo-Mario: A platformer that allows the player to complete levels that mimic those of a 1985 Mario game. This project will allow the player to operate the Mario avatar to move in various ways to overcome all obstacles, with the goal to reach the flag at the end of the level. We will code this project in Java processing to emphasize the graphics component of the project.

Compile Instructions:
    To Be Continued

Development Log:
    Kelly Yu
      5/23: I have changed the name of the World class to Level. I have created the skeleton of Game & Level classes that we have planned so far. Additionally, I have begun completing the setup method in Game & the constructor for Level.

      5/24: I have created Entity & edited the Asset class. I have tested out the constructors of these classes in Game

      5/25: I have created Player & have begun coding for the player to move. I have added methods and fields to various classes to better help figure out the player's location and movement.

      5/26: I have changed all the fields to become public. I have started on the movement controls, but have faced some problems trying to implement the controls and will probably model after the class example tomorrow.

      5/27: I have changed the controls to keep track of multiple keys. The player can now move left and right but has problems with displaying the correct direction to face. Player will display the correct sprite for each action (but still may need fixing). I seem to be having problems running the code though.

      5/30: The player can now move around, but doesn't change sprite based on movement. The player is blocked by boundaries of the screen but no the blocks.

      6/1: I added a new animation class and changed all the constructors so that texture would be an animation. I'm currently working on Player's display.

      6/2: Majority of the player's display is working. I changed the utilization of Animation for all constructors. I added a floor class that extends block.

      6/4: I haven't fixed the problems with player's movements and display. I have made small adjustments to the constructors of Animation & Asset (so that Animation takes in a start image) and Block, Block's subclasses, and Collectable (to reflect how Collectable is no longer a subclass of Block & the field contains is a Collectable). I have started building on Flag's event method and tried testing it in game along with Brick.

      6/5: I have added background and tested bricks. I have changed the parameters of Asset and fixed the sub classes' constructors. I have created the Enemy & Goomba classes.

      6/6: I have fixed the idle animation for the player & added debug code for collision. I have begun testing goombas.

      6/7: I have implemented a global variable of sizeUnit & used it to dictate size in Asset's w & h. I have added floor as one of the blocks being read in by the file for map.

    Emily Young-Squire
      5/23: I have begun to write the skeletons for the Asset class instance variables and methods we have planned.

      5/24: I have finished writing the instance variables and methods for the asset class and am now moving on to the subclasses.

      5/25: I have created and written the skeleton for a Block subclass of the asset class and fixed up errors that I have found in the Asset class.

      5/26: I have finished the Block class and made sure that it fits in with the rest of the files.

      5/27: I have created the skeleton of the collectable class and have added in the basic methods and instance variables.

      5/28: I have finished the collectable class and slightly changed the instance variables to better fit into the game.

      5/29: I have left merging a bit too long, so I am trying to fix the error that I am having in merging my branch with the main branch, and I am starting to look into how to write the timer class.

      5/30: I have fixed the huge merge conflict error and am finally able to successfully merge the changes I have made, and I have changed the instance variables from private to public, and have adjusted the methods accordingly.

      5/31: I have created the basic base of the Mario game of a layer of blocks underneath Mario and imported the block image that will be used.

      6/1: I have worked on fixing the error where Mario can only touch the blocks and other assets but cannot stand in front or behind them.

      6/2:  I have worked on reading in a separate file with the map of blocks and assets, as well as devising some sort of key to interpret all of it (as well as the beginnings of a Timer class).

      6/3: I have worked with Kelly to edit the UML diagram and add the new instance variables and methods, and understand how the new animation works and how that will fit with the other entities (other than player).

      6/4: I have begun and finished the new subclass of the block class, flag class, and added a corresponding new instance variable to the Game class (won).

      6/5: I have begun and finished the new subclass of the block class, trap class, and added a corresponding new instance variable to the Game class (died).

      6/6: I have figured out how to create a map file that can be read into the program to generate the map of blocks that will appear on the screen (extending beyond the dimensions of the window) and will later include the location of other assets.
