interface Poker {
    /**
     * Draw card number side as a image
     * @summary Poker.getCardImage  (size, suit, point)
     * @param {number} [size=200] - Height pixel of card. The ratio of card width and height is fixed to 3:4.
     * @param {string} [suit='h'] - Poker suit. The value is case insensitive and it should be one of these value in []:
     *     ['h', 'hearts', 'd', 'diamonds', 's', 'spades', 'c', 'clubs']
     *     'h', 'd', 's', 'c' are abbreviation
     *     When card point is 'O', 'h' or 'd' means big joker, 's' or 'c' means little joker.
     * @param {string} [point='O'] - Card point. The value is case insensitive and it should be one of these value in []:
     *     ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'O', 'JOKER']
     *     'O'(letter O) is abbreviation of 'JOKER'
     * @return {HTMLElement} image
     * @example
     *     document.body.appendChild(Poker.getCardImage(100, 'h', 'Q'));
     */
    getCardImage(size: number, suit: string, point: string): HTMLImageElement;

    /**
     * Draw card number side in a canvas
     * @summary Poker.getCardCanvas (size, suit, point)
     * @param {number} [size=200] - Height pixel of card. The ratio of card width and height is fixed to 3:4.
     * @param {string} [suit='h'] - Poker suit. The value is case insensitive and it should be one of these value in []:
     *     ['h', 'hearts', 'd', 'diamonds', 's', 'spades', 'c', 'clubs']
     *     'h', 'd', 's', 'c' are abbreviation
     *     When card point is 'O', 'h' or 'd' means big joker, 's' or 'c' means little joker.
     * @param {string} [point='O'] - Card point. The value is case insensitive and it should be one of these value in []:
     *     ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'O', 'JOKER']
     *     'O'(letter O) is abbreviation of 'JOKER'
     * @return {HTMLElement} canvas
     * @example
     *     document.body.appendChild(Poker.getCardCanvas(100, 'h', 'Q'));
     */
    getCardCanvas(size: number, suit: string, point: string): HTMLCanvasElement;

    /**
     * Get card number side image data
     * @summary Poker.getCardData   (size, suit, point)
     * @param {number} [size=200] - Height pixel of card. The ratio of card width and height is fixed to 3:4.
     * @param {string} [suit='h'] - Poker suit. The value is case insensitive and it should be one of these value in []:
     *     ['h', 'hearts', 'd', 'diamonds', 's', 'spades', 'c', 'clubs']
     *     'h', 'd', 's', 'c' are abbreviation
     *     When card point is 'O', 'h' or 'd' means big joker, 's' or 'c' means little joker.
     * @param {string} [point='O'] - Card point. The value is case insensitive and it should be one of these value in []:
     *     ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'O', 'JOKER']
     *     'O'(letter O) is abbreviation of 'JOKER'
     * @return {string} imageData
     * @example
     *     var imgData = Poker.getCardData(100, 'h', 'Q');
     */
    getCardData(size: number, suit: string, point: string): string;

    /**
     * Draw card back side as a image
     * @summary Poker.getBackImage  (size[, foregroundColor, backgroundColor])
     * @param {number} [size=200] - Height pixel of card. The ratio of card width and height is fixed to 3:4.
     * @param {string} [foregroundColor='#BB5555'] - Foreground color.
     * @param {string} [backgroundColor='#AA2222'] - Background color.
     * @return {HTMLElement} image
     * @example
     *   document.body.appendChild(Poker.getBackImage(300, '#2E319C', '#7A7BB8'));
     */
    getBackImage(size: number, foregroundColor: string, backgroundColor: string): HTMLImageElement

    /**
     * Draw card back side in a canvas
     * @summary Poker.getBackCanvas (size[, foregroundColor, backgroundColor])
     * @param {number} [size=200] - Height pixel of card. The ratio of card width and height is fixed to 3:4.
     * @param {string} [foregroundColor='#BB5555'] - Foreground color.
     * @param {string} [backgroundColor='#AA2222'] - Background color.
     * @return {HTMLElement} canvas
     * @example
     *   document.body.appendChild(Poker.getBackCanvas(300, '#2E319C', '#7A7BB8'));
     */
    getBackCanvas(size: number, foregroundColor: string, backgroundColor: string): HTMLCanvasElement

    /**
     * Get card back side image data
     * @summary Poker.getBackData   (size[, foregroundColor, backgroundColor])
     * @param {number} [size=200] - Height pixel of card. The ratio of card width and height is fixed to 3:4.
     * @param {string} [foregroundColor='#BB5555'] - Foreground color.
     * @param {string} [backgroundColor='#AA2222'] - Background color.
     * @return {string} imageData
     * @example
     *   var imageData = Poker.getBackCanvas(300, '#2E319C', '#7A7BB8');
     */
    getBackData(size: number, foregroundColor: string, backgroundColor: string): string;
}

interface CanvasRenderingContext2D {
    /**
     * Draw card number side
     * @summary canvas.drawPokerCard (x, y, size, suit, point)
     * @param {number} [x=0] - The x coordinate of top left corner of card in canvas.
     * @param {number} [y=0] - The y coordinate of top left corner of card in canvas.
     * @param {number} [size=200] - Height pixel of card. The ratio of card width and height is fixed to 3:4.
     * @param {string} [suit='h'] - Poker suit. The value is case insensitive and it should be one of these value in []:
     *     ['h', 'hearts', 'd', 'diamonds', 's', 'spades', 'c', 'clubs']
     *     'h', 'd', 's', 'c' are abbreviation
     *     When card point is 'O', 'h' or 'd' means big joker, 's' or 'c' means little joker.
     * @param {string} [point='O'] - Card point. The value is case insensitive and it should be one of these value in []:
     *     ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'O', 'JOKER']
     *     'O'(letter O) is abbreviation of 'JOKER'
     * @example
     *     canvas.drawPokerCard (0, 400, 100, 'hearts', 'O');
     *     canvas.drawPokerCard (0, 200, 100, 'd', 'Q');
     */
    drawPokerCard(x: number, y: number, size: number, suit: string, point: string): void;
    /**
     * Draw card back side
     * @summary canvas.drawPokerBack (x, y, size[, foregroundColor, backgroundColor])
     * @param {number} [x=0] - The x coordinate of top left corner of card in canvas.
     * @param {number} [y=0] - The y coordinate of top left corner of card in canvas.
     * @param {number} [size=200] - Height pixel of card. The ratio of card width and height is fixed to 3:4.
     * @param {string} [foregroundColor='#BB5555'] - Foreground color.
     * @param {string} [backgroundColor='#AA2222'] - Background color.
     * @example
     *     canvas.drawPokerBack (10, 10, 300, '#a22', '#b55')
     *     canvas.drawPokerBack (375, 400, 100, '#2E319C', '#7A7BB8');
     */
    drawPokerBack(x: number, y: number, size: number, foregroundColor: string, backgroundColor: string): void;
    /**
     * Draw round corner rectangle
     * @summary canvas.roundRect       (x, y[, width, height[, radius[, direction]]])
     * @param {number} [x=0] - The x coordinate of top left corner of rectangle in canvas.
     * @param {number} [y=0] - The y coordinate of top left corner of rectangle in canvas.
     * @param {number} [width=200] - Width of the rectangle.
     * @param {number} [height=200] - Height of the rectangle.
     * @param {number} [radius=20] - Radius of corner round.
     * @param {boolean} [direction=false] - Direction of corner round. The true or false means inward or outward.
     * @example
     *     canvas.roundRect (0, 0, 200, 200, 30);
     *     canvas.roundRect (50, 50, 100, 100, 30, true);
     */
    roundRect(x: number, y: number, width: number, height: number, radius: number, direction: boolean): void;
    /**
    * Stroke round corner rectangle
    * @summary canvas.strokeRoundRect (x, y[, width, height[, radius[, direction]]])
    * @param {number} [x=0] - The x coordinate of top left corner of rectangle in canvas.
    * @param {number} [y=0] - The y coordinate of top left corner of rectangle in canvas.
    * @param {number} [width=200] - Width of the rectangle.
    * @param {number} [height=200] - Height of the rectangle.
    * @param {number} [radius=20] - Radius of corner round.
    * @param {boolean} [direction=false] - Direction of corner round. The true or false means inward or outward.
    * @example
    *     canvas.strokeRoundRect (0, 0, 200, 200, 30);
    *     canvas.strokeRoundRect (50, 50, 100, 100, 30, true);
    */
    strokeRoundRect(x: number, y: number, width: number, height: number, radius?: number, direction?: boolean);
    /**
     * Fill round corner rectangle
     * @summary canvas.fillRoundRect   (x, y[, width, height[, radius[, direction]]])
     * @param {number} [x=0] - The x coordinate of top left corner of rectangle in canvas.
     * @param {number} [y=0] - The y coordinate of top left corner of rectangle in canvas.
     * @param {number} [width=200] - Width of the rectangle.
     * @param {number} [height=200] - Height of the rectangle.
     * @param {number} [radius=20] - Radius of corner round.
     * @param {boolean} [direction=false] - Direction of corner round. The true or false means inward or outward.
     * @example
     *     canvas.fillRoundRect (0, 0, 200, 200, 30);
     *     canvas.fillRoundRect (50, 50, 100, 100, 30, true);
     */
    fillRoundRect(x: number, y: number, width: number, height: number, radius?: number, direction?: boolean): void;
    /**
     * Draw SVG curve
     * @summary canvas.svgCurve (x, y, size, svgPath)
     * @param {number} [x=0] - The x coordinate of top left corner of card in canvas.
     * @param {number} [y=0] - The y coordinate of top left corner of card in canvas.
     * @param {number} size - The pixel size of the curve.
     * @param {string} svgPath - Value of property 'd' of SVG 'path' method.
     *     When create the curve by svg software, please move the origin of coordinate be 0,0.
     *     And keep the bigger size of height and width to 200px.
     *     Don't use AQ or T method in svg software, browser canvas have not relative method to render it.
     * @example
     *     draw a heart symbol:
     *     canvas.svgCurve ('M100,30C60,7 0,7 0,76C0,131 100,190 100,190C100,190 200,131 200,76C200,7 140,7 100,30z', 0, 0, 200));
     */
    svgCurve(x: number, y: number, size: number, svgPath: string): void;
    /**
     * Draw poker symbol
     * @summary canvas.drawPokerSymbol   (x, y, size[, symbol])
     * @param {number} [x=0] - The x coordinate of top left corner of card in canvas.
     * @param {number} [y=0] - The y coordinate of top left corner of card in canvas.
     * @param {number} [size=200] - Height pixel of card. The ratio of card width and height is fixed to 3:4.
     * @param {string} [symbol='O'] - The name of symbol.  Value is case insensitive and should be one of below:
     *     ['h', 'hearts', 'd', 'diamonds', 's', 'spades', 'c', 'clubs']
     *     'h', 'd', 's', 'c' are abbreviation
     *     ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'O', 'JOKER']
     *     'O'(letter O) is abbreviation of 'JOKER'
     *     ['R', 'CROWN']  // crown, a part of crown, to jointing a crown of JOKER card
     *     ['N', 'NINE']  // Nine, bold '9' for jointing '99' pattern
     * @example
     *     canvas.drawPokerSymbol (0, 0, 200, 'hearts');
     */
    drawPokerSymbol(x: number, y: number, size: number, symbol: string): void;
    /**
     * Stroke poker symbol
     * @summary canvas.strokePokerSymbol (x, y, size[, symbol])
     * @param {number} [x=0] - The x coordinate of top left corner of card in canvas.
     * @param {number} [y=0] - The y coordinate of top left corner of card in canvas.
     * @param {number} [size=200] - Height pixel of card. The ratio of card width and height is fixed to 3:4.
     * @param {string} [symbol='O'] - The name of symbol.  Value is case insensitive and should be one of below:
     *     ['h', 'hearts', 'd', 'diamonds', 's', 'spades', 'c', 'clubs']
     *     'h', 'd', 's', 'c' are abbreviation
     *     ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'O', 'JOKER']
     *     'O'(letter O) is abbreviation of 'JOKER'
     *     ['R', 'CROWN']  // crown, a part of crown, to jointing a crown of JOKER card
     *     ['N', 'NINE']  // Nine, bold '9' for jointing '99' pattern
     * @example
     *     canvas.strokePokerSymbol (0, 0, 200, 'hearts');
     */
    strokePokerSymbol(x: number, y: number, size: number, symbol: string): void;
    /**
     * Fill poker symbol
     * @summary canvas.fillPokerSymbol   (x, y, size[, symbol])
     * @param {number} [x=0] - The x coordinate of top left corner of card in canvas.
     * @param {number} [y=0] - The y coordinate of top left corner of card in canvas.
     * @param {number} [size=200] - Height pixel of card. The ratio of card width and height is fixed to 3:4.
     * @param {string} [symbol='O'] - The name of symbol.  Value is case insensitive and should be one of below:
     *     ['h', 'hearts', 'd', 'diamonds', 's', 'spades', 'c', 'clubs']
     *     'h', 'd', 's', 'c' are abbreviation
     *     ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'O', 'JOKER']
     *     'O'(letter O) is abbreviation of 'JOKER'
     *     ['R', 'CROWN']  // crown, a part of crown, to jointing a crown of JOKER card
     *     ['N', 'NINE']  // Nine, bold '9' for jointing '99' pattern
     * @example
     *     canvas.fillPokerSymbol (0, 0, 200, 'hearts');
     */
    fillPokerSymbol(x: number, y: number, size: number, symbol: string);
    /**
     * Draw crown
     * @summary canvas.drawPokerCrown (x, y, size[, startColor, endColor[, fillColor]])
     * @param {number} [x=0] - The x coordinate of top left corner of card in canvas.
     * @param {number} [y=0] - The y coordinate of top left corner of card in canvas.
     * @param {number} [size=200] - Height pixel of card. The ratio of card width and height is fixed to 3:4.
     * @param {string} [startColor='#FDF98B'] - Start color of gradient background color.
     * @param {string} [endColor ='#E7BD4F'] - End color of gradient background color.
     * @param {string} [fillColor ='#FFFFFF'] - Fill color of jewel of crown.
     * @example
     *     canvas.drawPokerCrown(0, 0, 200);
     */
    drawPokerCrown(x: number, y: number, size: number, startColor: string, endColor: string, fillColor: string): void;
    /**
     * Draw blank card
     * @summary canvas.drawEmptyCard (x, y, size[, startColor, endColor])
     * @param {number} [x=0] - The x coordinate of top left corner of card in canvas.
     * @param {number} [y=0] - The y coordinate of top left corner of card in canvas.
     * @param {number} [size=200] - Height pixel of card. The ratio of card width and height is fixed to 3:4.
     * @example
     *     canvas.drawEmptyCard(0, 0, 200);
     */
    drawEmptyCard(x: number, y: number, size: number): void;
}