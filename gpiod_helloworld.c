/** @file   blink.c                                                     */
/** @author Gastón Hugo Salazar Silva <ghsalazar@ipn.mx>                */
/**                                                                     */
/** Es un pequeño ejemplo de las funcionalidades del interfaz del GPIO  */
/** de la Raspberry Pi por medio de la librería libgpiod.               */
/**                                                                     */
/** Para compilar el programa, se debe utilizar el comando:             */
/**     gcc blink.c -lgpiod -o blink                                    */

#include <gpiod.h>
#include <unistd.h>

int main()
{
    int state = 1;
    int input = 1;

    struct gpiod_chip *chip;
    chip = gpiod_chip_open_by_name("gpiochip0");

    struct gpiod_line *led;
    led = gpiod_chip_get_line(chip, 24);
    gpiod_line_request_output(led, "myLED", 0);

    struct gpiod_line *button;
    button = gpiod_chip_get_line(chip, 6);
    gpiod_line_request_input(button, "button");

    while (input == 1) {
        state = state ^ 1;
        gpiod_line_set_value(led, state);
        input = gpiod_line_get_value(button);
        usleep(500000);
    }

    gpiod_line_set_value(led, 1);
    gpiod_line_release(led);
    gpiod_line_release(button);
    return 0;
}
